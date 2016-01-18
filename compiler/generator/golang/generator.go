package golang

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"unicode"

	"github.com/Workiva/frugal/compiler/generator"
	"github.com/Workiva/frugal/compiler/globals"
	"github.com/Workiva/frugal/compiler/parser"
)

const (
	lang             = "go"
	defaultOutputDir = "gen-go"
	serviceSuffix    = "_service"
	scopeSuffix      = "_scope"
	asyncSuffix      = "_async"
)

type Generator struct {
	*generator.BaseGenerator
	generateConstants bool
}

func NewGenerator(options map[string]string) generator.LanguageGenerator {
	return &Generator{&generator.BaseGenerator{Options: options}, true}
}

func (g *Generator) GetOutputDir(dir string) string {
	if pkg, ok := g.Frugal.Thrift.Namespace(lang); ok {
		path := generator.GetPackageComponents(pkg)
		dir = filepath.Join(append([]string{dir}, path...)...)
	} else {
		dir = filepath.Join(dir, g.Frugal.Name)
	}
	return dir
}

func (g *Generator) DefaultOutputDir() string {
	return defaultOutputDir
}

func (g *Generator) GenerateThrift() bool {
	return true
}

func (g *Generator) GenerateDependencies(dir string) error {
	return nil
}

func (g *Generator) GenerateFile(name, outputDir string, fileType generator.FileType) (*os.File, error) {
	switch fileType {
	case generator.CombinedServiceFile:
		return g.CreateFile(strings.ToLower(name)+serviceSuffix, outputDir, lang, true)
	case generator.CombinedScopeFile:
		return g.CreateFile(strings.ToLower(name)+scopeSuffix, outputDir, lang, true)
	default:
		return nil, fmt.Errorf("frugal: Bad file type for golang generator: %s", fileType)
	}
}

func (g *Generator) GenerateDocStringComment(file *os.File) error {
	comment := fmt.Sprintf(
		"// Autogenerated by Frugal Compiler (%s)\n"+
			"// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING",
		globals.Version)

	_, err := file.WriteString(comment)
	return err
}

func (g *Generator) GenerateServicePackage(file *os.File, s *parser.Service) error {
	return g.generatePackage(file)
}

func (g *Generator) GenerateScopePackage(file *os.File, s *parser.Scope) error {
	return g.generatePackage(file)
}

func (g *Generator) generatePackage(file *os.File) error {
	pkg, ok := g.Frugal.Thrift.Namespace(lang)
	if ok {
		components := generator.GetPackageComponents(pkg)
		pkg = components[len(components)-1]
	} else {
		pkg = g.Frugal.Name
	}
	_, err := file.WriteString(fmt.Sprintf("package %s", pkg))
	return err
}

func (g *Generator) GenerateServiceImports(file *os.File, s *parser.Service) error {
	imports := "import (\n"
	imports += "\t\"bytes\"\n"
	imports += "\t\"fmt\"\n"
	imports += "\t\"sync\"\n"
	imports += "\t\"time\"\n\n"
	if g.Options["thrift_import"] != "" {
		imports += "\t\"" + g.Options["thrift_import"] + "\"\n"
	} else {
		imports += "\t\"git.apache.org/thrift.git/lib/go/thrift\"\n"
	}
	if g.Options["frugal_import"] != "" {
		imports += "\t\"" + g.Options["frugal_import"] + "\"\n"
	} else {
		imports += "\t\"github.com/Workiva/frugal-go\"\n"
	}
	imports += ")\n\n"

	imports += "// (needed to ensure safety because of naive import list construction.)\n"
	imports += "var _ = thrift.ZERO\n"
	imports += "var _ = fmt.Printf\n"
	imports += "var _ = bytes.Equal"

	_, err := file.WriteString(imports)
	return err
}

func (g *Generator) GenerateScopeImports(file *os.File, s *parser.Scope) error {
	imports := "import (\n"
	imports += "\t\"fmt\"\n"
	imports += "\t\"log\"\n\n"
	if g.Options["thrift_import"] != "" {
		imports += "\t\"" + g.Options["thrift_import"] + "\"\n"
	} else {
		imports += "\t\"git.apache.org/thrift.git/lib/go/thrift\"\n"
	}
	if g.Options["frugal_import"] != "" {
		imports += "\t\"" + g.Options["frugal_import"] + "\"\n"
	} else {
		imports += "\t\"github.com/Workiva/frugal-go\"\n"
	}

	pkgPrefix := g.Options["package_prefix"]
	for _, include := range g.Frugal.ReferencedIncludes() {
		namespace, ok := g.Frugal.NamespaceForInclude(include, lang)
		if !ok {
			namespace = include
		}
		imports += fmt.Sprintf("\t\"%s%s\"\n", pkgPrefix, namespace)
	}

	imports += ")"

	_, err := file.WriteString(imports)
	return err
}

func (g *Generator) GenerateConstants(file *os.File, name string) error {
	if !g.generateConstants {
		return nil
	}
	constants := fmt.Sprintf("const delimiter = \"%s\"", globals.TopicDelimiter)
	_, err := file.WriteString(constants)
	if err != nil {
		return err
	}
	g.generateConstants = false
	return nil
}

func (g *Generator) GeneratePublisher(file *os.File, scope *parser.Scope) error {
	scopeLower := lowercaseFirstLetter(scope.Name)
	scopeTitle := strings.Title(scope.Name)

	publisher := ""
	if scope.Comment != nil {
		publisher += g.GenerateInlineComment(scope.Comment, "")
	}
	args := ""
	if len(scope.Prefix.Variables) > 0 {
		prefix := ""
		for _, variable := range scope.Prefix.Variables {
			args += prefix + variable
			prefix = ", "
		}
		args += " string, "
	}

	publisher += fmt.Sprintf("type %sPublisher interface {\n", scopeTitle)
	publisher += "\tOpen() error\n"
	publisher += "\tClose() error\n"
	for _, op := range scope.Operations {
		publisher += fmt.Sprintf("\tPublish%s(ctx *frugal.FContext, %sreq *%s) error\n", op.Name, args, g.qualifiedParamName(op))
	}
	publisher += "}\n\n"

	publisher += fmt.Sprintf("type %sPublisher struct {\n", scopeLower)
	publisher += "\ttransport frugal.FScopeTransport\n"
	publisher += "\tprotocol  *frugal.FProtocol\n"
	publisher += "}\n\n"

	publisher += fmt.Sprintf("func New%sPublisher(provider *frugal.FScopeProvider) %sPublisher {\n",
		scopeTitle, scopeTitle)
	publisher += "\ttransport, protocol := provider.New()\n"
	publisher += fmt.Sprintf("\treturn &%sPublisher{\n", scopeLower)
	publisher += "\t\ttransport: transport,\n"
	publisher += "\t\tprotocol:  protocol,\n"
	publisher += "\t}\n"
	publisher += "}\n\n"

	publisher += fmt.Sprintf("func (l *%sPublisher) Open() error {\n", scopeLower)
	publisher += "\treturn l.transport.Open()\n"
	publisher += "}\n\n"

	publisher += fmt.Sprintf("func (l *%sPublisher) Close() error {\n", scopeLower)
	publisher += "\treturn l.transport.Close()\n"
	publisher += "}\n\n"

	prefix := ""
	for _, op := range scope.Operations {
		publisher += prefix
		prefix = "\n\n"
		if op.Comment != nil {
			publisher += g.GenerateInlineComment(op.Comment, "")
		}
		publisher += fmt.Sprintf("func (l *%sPublisher) Publish%s(ctx *frugal.FContext, %sreq *%s) error {\n",
			scopeLower, op.Name, args, g.qualifiedParamName(op))
		publisher += fmt.Sprintf("\top := \"%s\"\n", op.Name)
		publisher += fmt.Sprintf("\tprefix := %s\n", generatePrefixStringTemplate(scope))
		publisher += "\ttopic := fmt.Sprintf(\"%s" + scopeTitle +
			"%s%s\", prefix, delimiter, op)\n"
		publisher += "\tif err := l.transport.LockTopic(topic); err != nil {\n"
		publisher += "\t\treturn err\n"
		publisher += "\t}\n"
		publisher += "\tdefer l.transport.UnlockTopic()\n"
		publisher += "\toprot := l.protocol\n"
		publisher += "\tif err := oprot.WriteRequestHeader(ctx); err != nil {\n"
		publisher += "\t\treturn err\n"
		publisher += "\t}\n"
		publisher += "\tif err := oprot.WriteMessageBegin(op, thrift.CALL, 0); err != nil {\n"
		publisher += "\t\treturn err\n"
		publisher += "\t}\n"
		publisher += "\tif err := req.Write(oprot); err != nil {\n"
		publisher += "\t\treturn err\n"
		publisher += "\t}\n"
		publisher += "\tif err := oprot.WriteMessageEnd(); err != nil {\n"
		publisher += "\t\treturn err\n"
		publisher += "\t}\n"
		publisher += "\treturn oprot.Flush()\n"
		publisher += "}"
	}

	_, err := file.WriteString(publisher)
	return err
}

func generatePrefixStringTemplate(scope *parser.Scope) string {
	if len(scope.Prefix.Variables) == 0 {
		if scope.Prefix.String == "" {
			return `""`
		}
		return fmt.Sprintf(`"%s%s"`, scope.Prefix.String, globals.TopicDelimiter)
	}
	template := "fmt.Sprintf(\""
	template += scope.Prefix.Template()
	template += globals.TopicDelimiter + "\", "
	prefix := ""
	for _, variable := range scope.Prefix.Variables {
		template += prefix + variable
		prefix = ", "
	}
	template += ")"
	return template
}

func (g *Generator) GenerateSubscriber(file *os.File, scope *parser.Scope) error {
	scopeLower := lowercaseFirstLetter(scope.Name)
	scopeTitle := strings.Title(scope.Name)

	subscriber := ""
	if scope.Comment != nil {
		subscriber += g.GenerateInlineComment(scope.Comment, "")
	}

	args := ""
	prefix := ""
	if len(scope.Prefix.Variables) > 0 {
		for _, variable := range scope.Prefix.Variables {
			args += prefix + variable
			prefix = ", "
		}
		args += " string, "
	}

	subscriber += fmt.Sprintf("type %sSubscriber interface {\n", scopeTitle)
	for _, op := range scope.Operations {
		subscriber += fmt.Sprintf("\tSubscribe%s(%shandler func(*frugal.FContext, *%s)) (*frugal.FSubscription, error)\n",
			op.Name, args, g.qualifiedParamName(op))
	}
	subscriber += "}\n\n"

	subscriber += fmt.Sprintf("type %sSubscriber struct {\n", scopeLower)
	subscriber += "\tprovider *frugal.FScopeProvider\n"
	subscriber += "}\n\n"

	subscriber += fmt.Sprintf("func New%sSubscriber(provider *frugal.FScopeProvider) %sSubscriber {\n",
		scopeTitle, scopeTitle)
	subscriber += fmt.Sprintf("\treturn &%sSubscriber{provider: provider}\n", scopeLower)
	subscriber += "}\n\n"

	prefix = ""
	for _, op := range scope.Operations {
		subscriber += prefix
		prefix = "\n\n"
		if op.Comment != nil {
			subscriber += g.GenerateInlineComment(op.Comment, "")
		}
		subscriber += fmt.Sprintf("func (l *%sSubscriber) Subscribe%s(%shandler func(*frugal.FContext, *%s)) (*frugal.FSubscription, error) {\n",
			scopeLower, op.Name, args, g.qualifiedParamName(op))
		subscriber += fmt.Sprintf("\top := \"%s\"\n", op.Name)
		subscriber += fmt.Sprintf("\tprefix := %s\n", generatePrefixStringTemplate(scope))
		subscriber += "\ttopic := fmt.Sprintf(\"%s" + scopeTitle + "%s%s\", prefix, delimiter, op)\n"
		subscriber += "\ttransport, protocol := l.provider.New()\n"
		subscriber += "\tif err := transport.Subscribe(topic); err != nil {\n"
		subscriber += "\t\treturn nil, err\n"
		subscriber += "\t}\n\n"
		subscriber += "\tsub := frugal.NewFSubscription(topic, transport)\n"
		subscriber += "\tgo func() {\n"
		subscriber += "\t\tfor {\n"
		subscriber += fmt.Sprintf("\t\t\tctx, received, err := l.recv%s(op, protocol)\n", op.Name)
		subscriber += "\t\t\tif err != nil {\n"
		subscriber += "\t\t\t\tif e, ok := err.(thrift.TTransportException); ok && e.TypeId() == thrift.END_OF_FILE {\n"
		subscriber += "\t\t\t\t\treturn\n"
		subscriber += "\t\t\t\t}\n"
		subscriber += "\t\t\t\tlog.Printf(\"frugal: error receiving %s: %s\\n\", topic, err.Error())\n"
		subscriber += "\t\t\t\tsub.Signal(err)\n"
		subscriber += "\t\t\t\tsub.Unsubscribe()\n"
		subscriber += "\t\t\t\treturn\n"
		subscriber += "\t\t\t}\n"
		subscriber += "\t\t\thandler(ctx, received)\n"
		subscriber += "\t\t}\n"
		subscriber += "\t}()\n\n"
		subscriber += "\treturn sub, nil\n"
		subscriber += "}\n\n"

		subscriber += fmt.Sprintf("func (l *%sSubscriber) recv%s(op string, iprot *frugal.FProtocol) (*frugal.FContext, *%s, error) {\n",
			scopeLower, op.Name, g.qualifiedParamName(op))
		subscriber += "\tctx, err := iprot.ReadRequestHeader()\n"
		subscriber += "\tif err != nil {\n"
		subscriber += "\t\treturn nil, nil, err\n"
		subscriber += "\t}\n"
		subscriber += "\tname, _, _, err := iprot.ReadMessageBegin()\n"
		subscriber += "\tif err != nil {\n"
		subscriber += "\t\treturn nil, nil, err\n"
		subscriber += "\t}\n"
		subscriber += "\tif name != op {\n"
		subscriber += "\t\tiprot.Skip(thrift.STRUCT)\n"
		subscriber += "\t\tiprot.ReadMessageEnd()\n"
		subscriber += "\t\tx9 := thrift.NewTApplicationException(thrift.UNKNOWN_METHOD, \"Unknown function \"+name)\n"
		subscriber += "\t\treturn nil, nil, x9\n"
		subscriber += "\t}\n"
		subscriber += fmt.Sprintf("\treq := &%s{}\n", g.qualifiedParamName(op))
		subscriber += "\tif err := req.Read(iprot); err != nil {\n"
		subscriber += "\t\treturn nil, nil, err\n"
		subscriber += "\t}\n\n"
		subscriber += "\tiprot.ReadMessageEnd()\n"
		subscriber += "\treturn ctx, req, nil\n"
		subscriber += "}"
	}

	_, err := file.WriteString(subscriber)
	return err
}

func (g *Generator) GenerateService(file *os.File, s *parser.Service) error {
	contents := ""
	contents += g.generateServiceInterface(s)
	contents += g.generateClient(s)
	contents += g.generateServer(s)

	_, err := file.WriteString(contents)
	return err
}

func (g *Generator) generateServiceInterface(service *parser.Service) string {
	contents := fmt.Sprintf("type F%s interface {\n", strings.Title(service.Name))
	for _, method := range service.Methods {
		if method.Comment != nil {
			contents += g.GenerateInlineComment(method.Comment, "\t")
		}
		contents += fmt.Sprintf("\t%s(*frugal.FContext%s) %s\n",
			strings.Title(method.Name), g.generateInterfaceArgs(method.Arguments),
			g.generateReturnArgs(method))
	}
	contents += "}\n\n"
	return contents
}

func (g *Generator) generateReturnArgs(method *parser.Method) string {
	if method.ReturnType == nil {
		return "(err error)"
	}
	return fmt.Sprintf("(r %s, err error)", g.getGoTypeFromThriftType(method.ReturnType))
}

func (g *Generator) generateClient(service *parser.Service) string {
	servTitle := strings.Title(service.Name)

	contents := fmt.Sprintf("type F%sClient struct {\n", servTitle)
	contents += "\ttransport       frugal.FTransport\n"
	contents += "\tprotocolFactory *frugal.FProtocolFactory\n"
	contents += "\toprot           *frugal.FProtocol\n"
	contents += "\tmu              sync.Mutex\n"
	contents += "}\n\n"

	contents += fmt.Sprintf(
		"func NewF%sClient(p *frugal.FServiceProvider) *F%sClient {\n",
		servTitle, servTitle)
	contents += "\tt := p.Transport()\n"
	contents += "\tf := p.ProtocolFactory()\n"
	contents += "\tt.SetRegistry(frugal.NewFClientRegistry())\n"
	contents += fmt.Sprintf("\treturn &F%sClient{\n", servTitle)
	contents += "\t\ttransport:       t,\n"
	contents += "\t\tprotocolFactory: f,\n"
	contents += "\t\toprot:           f.GetProtocol(t),\n"
	contents += "\t}\n"
	contents += "}\n\n"

	for _, method := range service.Methods {
		contents += g.generateClientMethod(service, method)
	}
	return contents
}

func (g *Generator) generateClientMethod(service *parser.Service, method *parser.Method) string {
	servTitle := strings.Title(service.Name)
	nameTitle := strings.Title(method.Name)

	// TODO: Is this assumption correct? Does Thrift just use the name as is?
	nameLower := strings.ToLower(method.Name)

	contents := ""
	if method.Comment != nil {
		contents += g.GenerateInlineComment(method.Comment, "")
	}
	contents += fmt.Sprintf("func (f *F%sClient) %s(ctx *frugal.FContext%s) %s {\n",
		servTitle, nameTitle, g.generateInputArgs(method.Arguments),
		g.generateReturnArgs(method))
	contents += "\terrorC := make(chan error, 1)\n"
	var returnType string
	if method.ReturnType == nil {
		returnType = "struct{}"
	} else {
		returnType = g.getGoTypeFromThriftType(method.ReturnType)
	}
	contents += fmt.Sprintf("\tresultC := make(chan %s, 1)\n", returnType)
	contents += fmt.Sprintf("\tif err = f.transport.Register(ctx, f.recv%sHandler(ctx, resultC, errorC)); err != nil {\n", nameTitle)
	contents += "\t\treturn\n"
	contents += "\t}\n"
	contents += "\tdefer f.transport.Unregister(ctx)\n"
	contents += "\tf.mu.Lock()\n"
	contents += fmt.Sprintf("\tif err = f.oprot.WriteRequestHeader(ctx); err != nil {\n")
	contents += "\t\tf.mu.Unlock()\n"
	contents += "\t\treturn\n"
	contents += "\t}\n"
	contents += fmt.Sprintf(
		"\tif err = f.oprot.WriteMessageBegin(\"%s\", thrift.CALL, 0); err != nil {\n", nameLower)
	contents += "\t\tf.mu.Unlock()\n"
	contents += "\t\treturn\n"
	contents += "\t}\n"
	contents += fmt.Sprintf("\targs := %s%sArgs{\n", servTitle, nameTitle)
	contents += g.generateStructArgs(method.Arguments)
	contents += "\t}\n"
	contents += "\tif err = args.Write(f.oprot); err != nil {\n"
	contents += "\t\tf.mu.Unlock()\n"
	contents += "\t\treturn\n"
	contents += "\t}\n"
	contents += "\tif err = f.oprot.WriteMessageEnd(); err != nil {\n"
	contents += "\t\tf.mu.Unlock()\n"
	contents += "\t\treturn\n"
	contents += "\t}\n"
	contents += "\tif err = f.oprot.Flush(); err != nil {\n"
	contents += "\t\tf.mu.Unlock()\n"
	contents += "\t\treturn\n"
	contents += "\t}\n"
	contents += "\tf.mu.Unlock()\n\n"

	contents += "\tselect {\n"
	contents += "\tcase err = <-errorC:\n"
	if method.ReturnType == nil {
		contents += "\tcase <-resultC:\n"
	} else {
		contents += "\tcase r = <-resultC:\n"
	}
	contents += "\tcase <-time.After(ctx.Timeout()):\n"
	contents += "\t\terr = frugal.ErrTimeout\n"
	contents += "\tcase <-f.transport.Closed():\n"
	contents += "\t\terr = frugal.ErrTransportClosed\n"
	contents += "\t}\n"
	contents += "\treturn\n"
	contents += "}\n\n"

	contents += fmt.Sprintf("func (f *F%sClient) recv%sHandler(ctx *frugal.FContext, resultC chan<- %s, errorC chan<- error) frugal.FAsyncCallback {\n", servTitle, nameTitle, returnType)
	contents += "\treturn func(tr thrift.TTransport) error {\n"
	contents += "\t\tiprot := f.protocolFactory.GetProtocol(tr)\n"
	contents += "\t\tif err := iprot.ReadResponseHeader(ctx); err != nil {\n"
	contents += "\t\t\terrorC <- err\n"
	contents += "\t\t\treturn err\n"
	contents += "\t\t}\n"
	contents += "\t\tmethod, mTypeId, _, err := iprot.ReadMessageBegin()\n"
	contents += "\t\tif err != nil {\n"
	contents += "\t\t\terrorC <- err\n"
	contents += "\t\t\treturn err\n"
	contents += "\t\t}\n"
	contents += fmt.Sprintf("\t\tif method != \"%s\" {\n", nameLower)
	contents += fmt.Sprintf(
		"\t\t\terr = thrift.NewTApplicationException(thrift.WRONG_METHOD_NAME, \"%s failed: wrong method name\")\n", nameLower)
	contents += "\t\t\terrorC <- err\n"
	contents += "\t\t\treturn err\n"
	contents += "\t\t}\n"
	contents += "\t\tif mTypeId == thrift.EXCEPTION {\n"
	contents += "\t\t\terror0 := thrift.NewTApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, \"Unknown Exception\")\n"
	contents += "\t\t\tvar error1 error\n"
	contents += "\t\t\terror1, err = error0.Read(iprot)\n"
	contents += "\t\t\tif err != nil {\n"
	contents += "\t\t\t\terrorC <- err\n"
	contents += "\t\t\t\treturn err\n"
	contents += "\t\t\t}\n"
	contents += "\t\t\tif err = iprot.ReadMessageEnd(); err != nil {\n"
	contents += "\t\t\t\terrorC <- err\n"
	contents += "\t\t\t\treturn err\n"
	contents += "\t\t\t}\n"
	contents += "\t\t\terr = error1\n"
	contents += "\t\t\terrorC <- err\n"
	contents += "\t\t\treturn err\n"
	contents += "\t\t}\n"
	contents += "\t\tif mTypeId != thrift.REPLY {\n"
	contents += fmt.Sprintf(
		"\t\t\terr = thrift.NewTApplicationException(thrift.INVALID_MESSAGE_TYPE_EXCEPTION, \"%s failed: invalid message type\")\n", nameLower)
	contents += "\t\t\terrorC <- err\n"
	contents += "\t\t\treturn err\n"
	contents += "\t\t}\n"
	contents += fmt.Sprintf("\t\tresult := %s%sResult{}\n", servTitle, nameTitle)
	contents += "\t\tif err = result.Read(iprot); err != nil {\n"
	contents += "\t\t\terrorC <- err\n"
	contents += "\t\t\treturn err\n"
	contents += "\t\t}\n"
	contents += "\t\tif err = iprot.ReadMessageEnd(); err != nil {\n"
	contents += "\t\t\terrorC <- err\n"
	contents += "\t\t\treturn err\n"
	contents += "\t\t}\n"
	for _, err := range method.Exceptions {
		errTitle := strings.Title(err.Name)
		contents += fmt.Sprintf("\t\tif result.%s != nil {\n", errTitle)
		contents += fmt.Sprintf("\t\t\terrorC <- result.%s\n", errTitle)
		contents += "\t\t\treturn nil\n"
		contents += "\t\t}\n"
	}
	if method.ReturnType == nil {
		contents += "\t\tresultC <- struct{}{}\n"
	} else {
		contents += "\t\tresultC <- result.GetSuccess()\n"
	}
	contents += "\t\treturn nil\n"
	contents += "\t}\n"
	contents += "}\n\n"

	return contents
}

func (g *Generator) generateServer(service *parser.Service) string {
	contents := ""
	contents += g.generateProcessor(service)
	for _, method := range service.Methods {
		contents += g.generateMethodProcessor(service, method)
	}
	return contents
}

func (g *Generator) generateProcessor(service *parser.Service) string {
	servTitle := strings.Title(service.Name)
	servLower := strings.ToLower(service.Name)
	contents := ""
	contents += fmt.Sprintf("type F%sProcessor struct {\n", servTitle)
	contents += "\tprocessorMap map[string]frugal.FProcessorFunction\n"
	contents += fmt.Sprintf("\thandler      F%s\n", servTitle)
	contents += "\twriteMu      *sync.Mutex\n"
	contents += "}\n\n"

	contents += fmt.Sprintf("func (p *F%sProcessor) GetProcessorFunction(key string) "+
		"(processor frugal.FProcessorFunction, ok bool) {\n", servTitle)
	contents += "\tprocessor, ok = p.processorMap[key]\n"
	contents += "\treturn\n"
	contents += "}\n\n"

	contents += fmt.Sprintf("func NewF%sProcessor(handler F%s) *F%sProcessor {\n",
		servTitle, servTitle, servTitle)
	contents += "\twriteMu := &sync.Mutex{}\n"
	contents += fmt.Sprintf("\tp := &F%sProcessor{\n", servTitle)
	contents += "\t\thandler:      handler,\n"
	contents += "\t\tprocessorMap: make(map[string]frugal.FProcessorFunction),\n"
	contents += "\t\twriteMu:      writeMu,\n"
	contents += "\t}\n"
	for _, method := range service.Methods {
		contents += fmt.Sprintf("\tp.processorMap[\"%s\"] = &%sF%s{handler: handler, writeMu: writeMu}\n",
			strings.ToLower(method.Name), servLower, strings.Title(method.Name))
	}
	contents += "\treturn p\n"
	contents += "}\n\n"

	contents += fmt.Sprintf(
		"func (p *F%sProcessor) Process(iprot, oprot *frugal.FProtocol) error {\n", servTitle)
	contents += "\tctx, err := iprot.ReadRequestHeader()\n"
	contents += "\tif err != nil {\n"
	contents += "\t\treturn err\n"
	contents += "\t}\n"
	contents += "\tname, _, _, err := iprot.ReadMessageBegin()\n"
	contents += "\tif err != nil {\n"
	contents += "\t\treturn err\n"
	contents += "\t}\n"
	contents += "\tif processor, ok := p.GetProcessorFunction(name); ok {\n"
	contents += "\t\treturn processor.Process(ctx, iprot, oprot)\n"
	contents += "\t}\n"
	contents += "\tiprot.Skip(thrift.STRUCT)\n"
	contents += "\tiprot.ReadMessageEnd()\n"
	contents += "\tx3 := thrift.NewTApplicationException(thrift.UNKNOWN_METHOD, \"Unknown function \"+name)\n"
	contents += "\tp.writeMu.Lock()\n"
	contents += "\toprot.WriteResponseHeader(ctx)\n"
	contents += "\toprot.WriteMessageBegin(name, thrift.EXCEPTION, 0)\n"
	contents += "\tx3.Write(oprot)\n"
	contents += "\toprot.WriteMessageEnd()\n"
	contents += "\toprot.Flush()\n"
	contents += "\tp.writeMu.Unlock()\n"
	contents += "\treturn x3\n"
	contents += "}\n\n"

	return contents
}

func (g *Generator) generateMethodProcessor(service *parser.Service, method *parser.Method) string {
	servTitle := strings.Title(service.Name)
	servLower := strings.ToLower(service.Name)
	nameTitle := strings.Title(method.Name)
	nameLower := strings.ToLower(method.Name)

	contents := fmt.Sprintf("type %sF%s struct {\n", servLower, nameTitle)
	contents += fmt.Sprintf("\thandler F%s\n", servTitle)
	contents += "\twriteMu *sync.Mutex\n"
	contents += "}\n\n"

	contents += fmt.Sprintf("func (p *%sF%s) Process(ctx *frugal.FContext, iprot, oprot *frugal.FProtocol) error {\n", servLower, nameTitle)
	contents += fmt.Sprintf("\targs := %s%sArgs{}\n", servTitle, nameTitle)
	contents += "\tvar err error\n"
	contents += "\tif err = args.Read(iprot); err != nil {\n"
	contents += "\t\tiprot.ReadMessageEnd()\n"
	contents += "\t\tx := thrift.NewTApplicationException(thrift.PROTOCOL_ERROR, err.Error())\n"
	contents += "\t\tp.writeMu.Lock()\n"
	contents += "\t\toprot.WriteResponseHeader(ctx)\n"
	contents += fmt.Sprintf("\t\toprot.WriteMessageBegin(\"%s\", thrift.EXCEPTION, 0)\n",
		nameLower)
	contents += "\t\tx.Write(oprot)\n"
	contents += "\t\toprot.WriteMessageEnd()\n"
	contents += "\t\toprot.Flush()\n"
	contents += "\t\tp.writeMu.Unlock()\n"
	contents += "\t\treturn err\n"
	contents += "\t}\n\n"

	contents += "\tiprot.ReadMessageEnd()\n"
	contents += fmt.Sprintf("\tresult := %s%sResult{}\n", servTitle, nameTitle)
	contents += "\tvar err2 error\n"
	if method.ReturnType != nil {
		contents += fmt.Sprintf("\tvar retval %s\n", g.getGoTypeFromThriftType(method.ReturnType))
		contents += fmt.Sprintf("\tif retval, err2 = p.handler.%s(%s); err2 != nil {\n",
			nameTitle, g.generateServerOutputArgs(method.Arguments))
	} else {
		contents += fmt.Sprintf("\tif err2 = p.handler.%s(%s); err2 != nil {\n",
			nameTitle, g.generateServerOutputArgs(method.Arguments))
	}
	if len(method.Exceptions) > 0 {
		contents += "\t\tswitch v := err2.(type) {\n"
		for _, err := range method.Exceptions {
			contents += fmt.Sprintf("\t\tcase %s:\n", g.getGoTypeFromThriftType(err.Type))
			contents += fmt.Sprintf("\t\t\tresult.%s = v\n", strings.Title(err.Name))
		}
		contents += "\t\tdefault:\n"
		contents += g.generateMethodException("\t\t\t", nameLower)
		contents += "\t\t}\n"
	} else {
		contents += g.generateMethodException("\t\t", nameLower)
	}
	if method.ReturnType != nil {
		contents += "\t} else {\n"
		contents += "\t\tresult.Success = &retval\n"
	}
	contents += "\t}\n"

	contents += "\tp.writeMu.Lock()\n"
	contents += "\tif err2 = oprot.WriteResponseHeader(ctx); err2 != nil {\n"
	contents += "\t\terr = err2\n"
	contents += "\t}\n"
	contents += fmt.Sprintf("\tif err2 = oprot.WriteMessageBegin(\"%s\", "+
		"thrift.REPLY, 0); err2 != nil {\n", nameLower)
	contents += "\t\terr = err2\n"
	contents += "\t}\n"
	contents += "\tif err2 = result.Write(oprot); err == nil && err2 != nil {\n"
	contents += "\t\terr = err2\n"
	contents += "\t}\n"
	contents += "\tif err2 = oprot.WriteMessageEnd(); err == nil && err2 != nil {\n"
	contents += "\t\terr = err2\n"
	contents += "\t}\n"
	contents += "\tif err2 = oprot.Flush(); err == nil && err2 != nil {\n"
	contents += "\t\terr = err2\n"
	contents += "\t}\n"
	contents += "\tp.writeMu.Unlock()\n"
	contents += "\treturn err\n"
	contents += "}\n\n"

	return contents
}

func (g *Generator) generateMethodException(prefix, methodName string) string {
	contents := fmt.Sprintf(prefix+"x := thrift.NewTApplicationException(thrift.INTERNAL_ERROR, "+
		"\"Internal error processing %s: \"+err2.Error())\n", methodName)
	contents += prefix + "p.writeMu.Lock()\n"
	contents += prefix + "oprot.WriteResponseHeader(ctx)\n"
	contents += fmt.Sprintf(prefix+"oprot.WriteMessageBegin(\"%s\", thrift.EXCEPTION, 0)\n",
		methodName)
	contents += prefix + "x.Write(oprot)\n"
	contents += prefix + "oprot.WriteMessageEnd()\n"
	contents += prefix + "oprot.Flush()\n"
	contents += prefix + "p.writeMu.Unlock()\n"
	contents += prefix + "return err2\n"
	return contents
}

func (g *Generator) generateInterfaceArgs(args []*parser.Field) string {
	argStr := ""
	for _, arg := range args {
		argStr += ", " + g.getGoTypeFromThriftType(arg.Type)
	}
	return argStr
}

func (g *Generator) generateClientOutputArgs(args []*parser.Field) string {
	argStr := ""
	for _, arg := range args {
		argStr += ", " + strings.ToLower(arg.Name)
	}
	return argStr
}

func (g *Generator) generateInputArgs(args []*parser.Field) string {
	argStr := ""
	for _, arg := range args {
		argStr += ", " + strings.ToLower(arg.Name) + " " + g.getGoTypeFromThriftType(arg.Type)
	}
	return argStr
}

func (g *Generator) generateStructArgs(args []*parser.Field) string {
	argStr := ""
	for _, arg := range args {
		argStr += "\t\t" + strings.Title(arg.Name) + ": " + strings.ToLower(arg.Name) + ",\n"
	}
	return argStr
}

func (g *Generator) generateServerOutputArgs(args []*parser.Field) string {
	argStr := "ctx"
	for _, arg := range args {
		argStr += fmt.Sprintf(", args.%s", strings.Title(arg.Name))
	}
	return argStr
}

func (g *Generator) getGoTypeFromThriftType(t *parser.Type) string {
	typeName := g.Frugal.Thrift.UnderlyingType(t.Name)
	switch typeName {
	case "bool":
		return "bool"
	case "byte":
		return "byte"
	case "i16":
		return "int16"
	case "i32":
		return "int32"
	case "i64":
		return "int64"
	case "double":
		return "float64"
	case "string":
		return "string"
	case "binary":
		return "[]byte"
	case "list":
		return fmt.Sprintf("[]%s", g.getGoTypeFromThriftType(t.ValueType))
	case "set":
		return fmt.Sprintf("map[%s]bool", g.getGoTypeFromThriftType(t.ValueType))
	case "map":
		return fmt.Sprintf("map[%s]%s", g.getGoTypeFromThriftType(t.KeyType),
			g.getGoTypeFromThriftType(t.ValueType))
	default:
		// This is a custom type, return a pointer to it
		return "*" + g.qualifiedTypeName(t)
	}
}

func (g *Generator) qualifiedTypeName(t *parser.Type) string {
	param := t.ParamName()
	include := t.IncludeName()
	if include != "" {
		namespace, ok := g.Frugal.NamespaceForInclude(include, lang)
		if !ok {
			namespace = include
		}
		param = fmt.Sprintf("%s.%s", namespace, param)
	}
	return param
}

func (g *Generator) qualifiedParamName(op *parser.Operation) string {
	param := op.ParamName()
	include := op.IncludeName()
	if include != "" {
		namespace, ok := g.Frugal.NamespaceForInclude(include, lang)
		if !ok {
			namespace = include
		}
		param = fmt.Sprintf("%s.%s", namespace, param)
	}
	return param
}

func lowercaseFirstLetter(s string) string {
	runes := []rune(s)
	runes[0] = unicode.ToLower(runes[0])
	return string(runes)
}
