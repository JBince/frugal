// Autogenerated by Frugal Compiler (3.16.5)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

package music

import (
	"bytes"
	"context"
	"fmt"

	frugal "github.com/Workiva/frugal/lib/go"
	"github.com/apache/thrift/lib/go/thrift"
	"github.com/sirupsen/logrus"
)

// (needed to ensure safety because of naive import list construction.)
var _ = thrift.ZERO
var _ = fmt.Printf
var _ = bytes.Equal
var _ = logrus.DebugLevel

// Services are the API for client and server interaction.
// Users can buy an album or enter a giveaway for a free album.
type FStore interface {
	BuyAlbum(fctx frugal.FContext, ASIN string, acct string) (r *Album, err error)
	// Deprecated: use something else
	EnterAlbumGiveaway(fctx frugal.FContext, email string, name string) (r bool, err error)
}

// Services are the API for client and server interaction.
// Users can buy an album or enter a giveaway for a free album.
type FStoreClient struct {
	c       frugal.FClient
	methods map[string]*frugal.Method
}

func NewFStoreClient(provider *frugal.FServiceProvider, middleware ...frugal.ServiceMiddleware) *FStoreClient {
	methods := make(map[string]*frugal.Method)
	client := &FStoreClient{
		c:       frugal.NewFStandardClient(provider),
		methods: methods,
	}
	middleware = append(middleware, provider.GetMiddleware()...)
	methods["buyAlbum"] = frugal.NewMethod(client, client.buyAlbum, "buyAlbum", middleware)
	methods["enterAlbumGiveaway"] = frugal.NewMethod(client, client.enterAlbumGiveaway, "enterAlbumGiveaway", middleware)
	return client
}

func (f *FStoreClient) Client_() frugal.FClient { return f.c }

func (f *FStoreClient) BuyAlbum(fctx frugal.FContext, asin string, acct string) (r *Album, err error) {
	ret := f.methods["buyAlbum"].Invoke([]interface{}{fctx, asin, acct})
	if len(ret) != 2 {
		panic(fmt.Sprintf("Middleware returned %d arguments, expected 2", len(ret)))
	}
	if ret[0] != nil {
		r = ret[0].(*Album)
	}
	if ret[1] != nil {
		err = ret[1].(error)
	}
	return r, err
}

func (f *FStoreClient) buyAlbum(fctx frugal.FContext, asin string, acct string) (r *Album, err error) {
	args := StoreBuyAlbumArgs{
		ASIN: asin,
		Acct: acct,
	}
	result := StoreBuyAlbumResult{}
	err = f.Client_().Call(fctx, "buyAlbum", &args, &result)
	if err != nil {
		return
	}
	if result.Error != nil {
		err = result.Error
		return
	}
	r = result.GetSuccess()
	return
}

// Deprecated: use something else
func (f *FStoreClient) EnterAlbumGiveaway(fctx frugal.FContext, email string, name string) (r bool, err error) {
	logrus.Warn("Call to deprecated function 'Store.EnterAlbumGiveaway'")
	ret := f.methods["enterAlbumGiveaway"].Invoke([]interface{}{fctx, email, name})
	if len(ret) != 2 {
		panic(fmt.Sprintf("Middleware returned %d arguments, expected 2", len(ret)))
	}
	if ret[0] != nil {
		r = ret[0].(bool)
	}
	if ret[1] != nil {
		err = ret[1].(error)
	}
	return r, err
}

func (f *FStoreClient) enterAlbumGiveaway(fctx frugal.FContext, email string, name string) (r bool, err error) {
	args := StoreEnterAlbumGiveawayArgs{
		Email: email,
		Name:  name,
	}
	result := StoreEnterAlbumGiveawayResult{}
	err = f.Client_().Call(fctx, "enterAlbumGiveaway", &args, &result)
	if err != nil {
		return
	}
	r = result.GetSuccess()
	return
}

type FStoreProcessor struct {
	*frugal.FBaseProcessor
}

func NewFStoreProcessor(handler FStore, middleware ...frugal.ServiceMiddleware) *FStoreProcessor {
	p := &FStoreProcessor{frugal.NewFBaseProcessor()}
	p.AddToProcessorMap("buyAlbum", &storeFBuyAlbum{frugal.NewFBaseProcessorFunction(p.GetWriteMutex(), frugal.NewMethod(handler, handler.BuyAlbum, "BuyAlbum", middleware))})
	p.AddToProcessorMap("enterAlbumGiveaway", &storeFEnterAlbumGiveaway{frugal.NewFBaseProcessorFunction(p.GetWriteMutex(), frugal.NewMethod(handler, handler.EnterAlbumGiveaway, "EnterAlbumGiveaway", middleware))})
	p.AddToAnnotationsMap("enterAlbumGiveaway", map[string]string{
		"deprecated": "use something else",
	})
	return p
}

type storeFBuyAlbum struct {
	*frugal.FBaseProcessorFunction
}

func (p *storeFBuyAlbum) Process(fctx frugal.FContext, iprot, oprot *frugal.FProtocol) error {
	ctx, cancelFn := frugal.ToContext(fctx)
	defer cancelFn()

	args := StoreBuyAlbumArgs{}
	err := args.Read(ctx, iprot)
	iprot.ReadMessageEnd(ctx)
	if err != nil {
		return p.SendError(fctx, oprot, frugal.APPLICATION_EXCEPTION_PROTOCOL_ERROR, "buyAlbum", err.Error())
	}
	result := StoreBuyAlbumResult{}
	ret := p.InvokeMethod([]interface{}{fctx, args.ASIN, args.Acct})
	if len(ret) != 2 {
		panic(fmt.Sprintf("Middleware returned %d arguments, expected 2", len(ret)))
	}
	if ret[1] != nil {
		err = ret[1].(error)
	}
	if err != nil {
		if typedError, ok := err.(thrift.TApplicationException); ok {
			p.SendError(fctx, oprot, typedError.TypeId(), "buyAlbum", typedError.Error())
			return nil
		}
		switch v := err.(type) {
		case *PurchasingError:
			result.Error = v
		default:
			return p.SendError(fctx, oprot, frugal.APPLICATION_EXCEPTION_INTERNAL_ERROR, "buyAlbum", "Internal error processing buyAlbum: "+err.Error())
		}
	} else {
		var retval *Album = ret[0].(*Album)
		result.Success = retval
	}
	return p.SendReply(fctx, oprot, "buyAlbum", &result)
}

type storeFEnterAlbumGiveaway struct {
	*frugal.FBaseProcessorFunction
}

func (p *storeFEnterAlbumGiveaway) Process(fctx frugal.FContext, iprot, oprot *frugal.FProtocol) error {
	logrus.Warn("Deprecated function 'Store.EnterAlbumGiveaway' was called by a client")
	ctx, cancelFn := frugal.ToContext(fctx)
	defer cancelFn()

	args := StoreEnterAlbumGiveawayArgs{}
	err := args.Read(ctx, iprot)
	iprot.ReadMessageEnd(ctx)
	if err != nil {
		return p.SendError(fctx, oprot, frugal.APPLICATION_EXCEPTION_PROTOCOL_ERROR, "enterAlbumGiveaway", err.Error())
	}
	result := StoreEnterAlbumGiveawayResult{}
	ret := p.InvokeMethod([]interface{}{fctx, args.Email, args.Name})
	if len(ret) != 2 {
		panic(fmt.Sprintf("Middleware returned %d arguments, expected 2", len(ret)))
	}
	if ret[1] != nil {
		err = ret[1].(error)
	}
	if err != nil {
		if typedError, ok := err.(thrift.TApplicationException); ok {
			p.SendError(fctx, oprot, typedError.TypeId(), "enterAlbumGiveaway", typedError.Error())
			return nil
		}
		return p.SendError(fctx, oprot, frugal.APPLICATION_EXCEPTION_INTERNAL_ERROR, "enterAlbumGiveaway", "Internal error processing enterAlbumGiveaway: "+err.Error())
	} else {
		var retval bool = ret[0].(bool)
		result.Success = &retval
	}
	return p.SendReply(fctx, oprot, "enterAlbumGiveaway", &result)
}

type StoreBuyAlbumArgs struct {
	ASIN string `thrift:"ASIN,1" db:"ASIN" json:"ASIN"`
	Acct string `thrift:"acct,2" db:"acct" json:"acct"`
}

func NewStoreBuyAlbumArgs() *StoreBuyAlbumArgs {
	return &StoreBuyAlbumArgs{}
}

func (p *StoreBuyAlbumArgs) GetASIN() string {
	return p.ASIN
}

func (p *StoreBuyAlbumArgs) GetAcct() string {
	return p.Acct
}

func (p *StoreBuyAlbumArgs) Read(ctx context.Context, iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin(ctx)
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 1:
			if err := p.ReadField1(ctx, iprot); err != nil {
				return err
			}
		case 2:
			if err := p.ReadField2(ctx, iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(ctx, fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(ctx); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	return nil
}

func (p *StoreBuyAlbumArgs) ReadField1(ctx context.Context, iprot thrift.TProtocol) error {
	if v, err := iprot.ReadString(ctx); err != nil {
		return thrift.PrependError("error reading field 1: ", err)
	} else {
		p.ASIN = v
	}
	return nil
}

func (p *StoreBuyAlbumArgs) ReadField2(ctx context.Context, iprot thrift.TProtocol) error {
	if v, err := iprot.ReadString(ctx); err != nil {
		return thrift.PrependError("error reading field 2: ", err)
	} else {
		p.Acct = v
	}
	return nil
}

func (p *StoreBuyAlbumArgs) Write(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin(ctx, "buyAlbum_args"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := p.writeField1(ctx, oprot); err != nil {
		return err
	}
	if err := p.writeField2(ctx, oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(ctx); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(ctx); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *StoreBuyAlbumArgs) writeField1(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteFieldBegin(ctx, "ASIN", thrift.STRING, 1); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field begin error 1:ASIN: ", p), err)
	}
	if err := oprot.WriteString(ctx, string(p.ASIN)); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T.ASIN (1) field write error: ", p), err)
	}
	if err := oprot.WriteFieldEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field end error 1:ASIN: ", p), err)
	}
	return nil
}

func (p *StoreBuyAlbumArgs) writeField2(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteFieldBegin(ctx, "acct", thrift.STRING, 2); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field begin error 2:acct: ", p), err)
	}
	if err := oprot.WriteString(ctx, string(p.Acct)); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T.acct (2) field write error: ", p), err)
	}
	if err := oprot.WriteFieldEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field end error 2:acct: ", p), err)
	}
	return nil
}

func (p *StoreBuyAlbumArgs) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("StoreBuyAlbumArgs(%+v)", *p)
}

type StoreBuyAlbumResult struct {
	Success *Album           `thrift:"success,0" db:"success" json:"success,omitempty"`
	Error   *PurchasingError `thrift:"error,1" db:"error" json:"error,omitempty"`
}

func NewStoreBuyAlbumResult() *StoreBuyAlbumResult {
	return &StoreBuyAlbumResult{}
}

var StoreBuyAlbumResult_Success_DEFAULT *Album

func (p *StoreBuyAlbumResult) IsSetSuccess() bool {
	return p.Success != nil
}

func (p *StoreBuyAlbumResult) GetSuccess() *Album {
	if !p.IsSetSuccess() {
		return StoreBuyAlbumResult_Success_DEFAULT
	}
	return p.Success
}

var StoreBuyAlbumResult_Error_DEFAULT *PurchasingError

func (p *StoreBuyAlbumResult) IsSetError() bool {
	return p.Error != nil
}

func (p *StoreBuyAlbumResult) GetError() *PurchasingError {
	if !p.IsSetError() {
		return StoreBuyAlbumResult_Error_DEFAULT
	}
	return p.Error
}

func (p *StoreBuyAlbumResult) Read(ctx context.Context, iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin(ctx)
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 0:
			if err := p.ReadField0(ctx, iprot); err != nil {
				return err
			}
		case 1:
			if err := p.ReadField1(ctx, iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(ctx, fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(ctx); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	return nil
}

func (p *StoreBuyAlbumResult) ReadField0(ctx context.Context, iprot thrift.TProtocol) error {
	p.Success = NewAlbum()
	if err := p.Success.Read(ctx, iprot); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T error reading struct: ", p.Success), err)
	}
	return nil
}

func (p *StoreBuyAlbumResult) ReadField1(ctx context.Context, iprot thrift.TProtocol) error {
	p.Error = NewPurchasingError()
	if err := p.Error.Read(ctx, iprot); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T error reading struct: ", p.Error), err)
	}
	return nil
}

func (p *StoreBuyAlbumResult) Write(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin(ctx, "buyAlbum_result"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := p.writeField0(ctx, oprot); err != nil {
		return err
	}
	if err := p.writeField1(ctx, oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(ctx); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(ctx); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *StoreBuyAlbumResult) writeField0(ctx context.Context, oprot thrift.TProtocol) error {
	if p.IsSetSuccess() {
		if err := oprot.WriteFieldBegin(ctx, "success", thrift.STRUCT, 0); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field begin error 0:success: ", p), err)
		}
		if err := p.Success.Write(ctx, oprot); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T error writing struct: ", p.Success), err)
		}
		if err := oprot.WriteFieldEnd(ctx); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field end error 0:success: ", p), err)
		}
	}
	return nil
}

func (p *StoreBuyAlbumResult) writeField1(ctx context.Context, oprot thrift.TProtocol) error {
	if p.IsSetError() {
		if err := oprot.WriteFieldBegin(ctx, "error", thrift.STRUCT, 1); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field begin error 1:error: ", p), err)
		}
		if err := p.Error.Write(ctx, oprot); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T error writing struct: ", p.Error), err)
		}
		if err := oprot.WriteFieldEnd(ctx); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field end error 1:error: ", p), err)
		}
	}
	return nil
}

func (p *StoreBuyAlbumResult) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("StoreBuyAlbumResult(%+v)", *p)
}

type StoreEnterAlbumGiveawayArgs struct {
	Email string `thrift:"email,1" db:"email" json:"email"`
	Name  string `thrift:"name,2" db:"name" json:"name"`
}

func NewStoreEnterAlbumGiveawayArgs() *StoreEnterAlbumGiveawayArgs {
	return &StoreEnterAlbumGiveawayArgs{}
}

func (p *StoreEnterAlbumGiveawayArgs) GetEmail() string {
	return p.Email
}

func (p *StoreEnterAlbumGiveawayArgs) GetName() string {
	return p.Name
}

func (p *StoreEnterAlbumGiveawayArgs) Read(ctx context.Context, iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin(ctx)
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 1:
			if err := p.ReadField1(ctx, iprot); err != nil {
				return err
			}
		case 2:
			if err := p.ReadField2(ctx, iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(ctx, fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(ctx); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayArgs) ReadField1(ctx context.Context, iprot thrift.TProtocol) error {
	if v, err := iprot.ReadString(ctx); err != nil {
		return thrift.PrependError("error reading field 1: ", err)
	} else {
		p.Email = v
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayArgs) ReadField2(ctx context.Context, iprot thrift.TProtocol) error {
	if v, err := iprot.ReadString(ctx); err != nil {
		return thrift.PrependError("error reading field 2: ", err)
	} else {
		p.Name = v
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayArgs) Write(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin(ctx, "enterAlbumGiveaway_args"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := p.writeField1(ctx, oprot); err != nil {
		return err
	}
	if err := p.writeField2(ctx, oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(ctx); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(ctx); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayArgs) writeField1(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteFieldBegin(ctx, "email", thrift.STRING, 1); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field begin error 1:email: ", p), err)
	}
	if err := oprot.WriteString(ctx, string(p.Email)); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T.email (1) field write error: ", p), err)
	}
	if err := oprot.WriteFieldEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field end error 1:email: ", p), err)
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayArgs) writeField2(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteFieldBegin(ctx, "name", thrift.STRING, 2); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field begin error 2:name: ", p), err)
	}
	if err := oprot.WriteString(ctx, string(p.Name)); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T.name (2) field write error: ", p), err)
	}
	if err := oprot.WriteFieldEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field end error 2:name: ", p), err)
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayArgs) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("StoreEnterAlbumGiveawayArgs(%+v)", *p)
}

type StoreEnterAlbumGiveawayResult struct {
	Success *bool `thrift:"success,0" db:"success" json:"success,omitempty"`
}

func NewStoreEnterAlbumGiveawayResult() *StoreEnterAlbumGiveawayResult {
	return &StoreEnterAlbumGiveawayResult{}
}

var StoreEnterAlbumGiveawayResult_Success_DEFAULT bool

func (p *StoreEnterAlbumGiveawayResult) IsSetSuccess() bool {
	return p.Success != nil
}

func (p *StoreEnterAlbumGiveawayResult) GetSuccess() bool {
	if !p.IsSetSuccess() {
		return StoreEnterAlbumGiveawayResult_Success_DEFAULT
	}
	return *p.Success
}

func (p *StoreEnterAlbumGiveawayResult) Read(ctx context.Context, iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin(ctx)
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 0:
			if err := p.ReadField0(ctx, iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(ctx, fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(ctx); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(ctx); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayResult) ReadField0(ctx context.Context, iprot thrift.TProtocol) error {
	if v, err := iprot.ReadBool(ctx); err != nil {
		return thrift.PrependError("error reading field 0: ", err)
	} else {
		p.Success = &v
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayResult) Write(ctx context.Context, oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin(ctx, "enterAlbumGiveaway_result"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := p.writeField0(ctx, oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(ctx); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(ctx); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayResult) writeField0(ctx context.Context, oprot thrift.TProtocol) error {
	if p.IsSetSuccess() {
		if err := oprot.WriteFieldBegin(ctx, "success", thrift.BOOL, 0); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field begin error 0:success: ", p), err)
		}
		if err := oprot.WriteBool(ctx, bool(*p.Success)); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T.success (0) field write error: ", p), err)
		}
		if err := oprot.WriteFieldEnd(ctx); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field end error 0:success: ", p), err)
		}
	}
	return nil
}

func (p *StoreEnterAlbumGiveawayResult) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("StoreEnterAlbumGiveawayResult(%+v)", *p)
}
