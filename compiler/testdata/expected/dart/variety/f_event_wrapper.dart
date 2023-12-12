// Autogenerated by Frugal Compiler (3.17.6)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

// ignore_for_file: unused_import
// ignore_for_file: unused_field
import 'dart:typed_data' show Uint8List;

import 'package:collection/collection.dart';
import 'package:thrift/thrift.dart' as thrift;
import 'package:variety/variety.dart' as t_variety;
import 'package:actual_base_dart/actual_base_dart.dart' as t_actual_base_dart;
import 'package:intermediate_include/intermediate_include.dart' as t_intermediate_include;
import 'package:validStructs/validStructs.dart' as t_validStructs;
import 'package:ValidTypes/ValidTypes.dart' as t_ValidTypes;
import 'package:subdir_include_ns/subdir_include_ns.dart' as t_subdir_include_ns;

class EventWrapper implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = thrift.TStruct('EventWrapper');
  static final thrift.TField _ID_FIELD_DESC = thrift.TField('ID', thrift.TType.I64, 1);
  static final thrift.TField _EV_FIELD_DESC = thrift.TField('Ev', thrift.TType.STRUCT, 2);
  static final thrift.TField _EVENTS_FIELD_DESC = thrift.TField('Events', thrift.TType.LIST, 3);
  static final thrift.TField _EVENTS2_FIELD_DESC = thrift.TField('Events2', thrift.TType.SET, 4);
  static final thrift.TField _EVENT_MAP_FIELD_DESC = thrift.TField('EventMap', thrift.TType.MAP, 5);
  static final thrift.TField _NUMS_FIELD_DESC = thrift.TField('Nums', thrift.TType.LIST, 6);
  static final thrift.TField _ENUMS_FIELD_DESC = thrift.TField('Enums', thrift.TType.LIST, 7);
  static final thrift.TField _A_BOOL_FIELD_FIELD_DESC = thrift.TField('aBoolField', thrift.TType.BOOL, 8);
  static final thrift.TField _A_UNION_FIELD_DESC = thrift.TField('a_union', thrift.TType.STRUCT, 9);
  static final thrift.TField _TYPEDEF_OF_TYPEDEF_FIELD_DESC = thrift.TField('typedefOfTypedef', thrift.TType.STRING, 10);
  static final thrift.TField _DEPR_FIELD_DESC = thrift.TField('depr', thrift.TType.BOOL, 11);
  static final thrift.TField _DEPR_BINARY_FIELD_DESC = thrift.TField('deprBinary', thrift.TType.STRING, 12);
  static final thrift.TField _DEPR_LIST_FIELD_DESC = thrift.TField('deprList', thrift.TType.LIST, 13);
  static final thrift.TField _EVENTS_DEFAULT_FIELD_DESC = thrift.TField('EventsDefault', thrift.TType.LIST, 14);
  static final thrift.TField _EVENT_MAP_DEFAULT_FIELD_DESC = thrift.TField('EventMapDefault', thrift.TType.MAP, 15);
  static final thrift.TField _EVENT_SET_DEFAULT_FIELD_DESC = thrift.TField('EventSetDefault', thrift.TType.SET, 16);
  static final thrift.TField _EVENTS_REQUIRED_FIELD_DESC = thrift.TField('EventsRequired', thrift.TType.LIST, 17);
  static final thrift.TField _EVENT_MAP_REQUIRED_FIELD_DESC = thrift.TField('EventMapRequired', thrift.TType.MAP, 18);
  static final thrift.TField _EVENT_SET_REQUIRED_FIELD_DESC = thrift.TField('EventSetRequired', thrift.TType.SET, 19);

  int _iD;
  static const int ID = 1;
  t_variety.Event _ev;
  static const int EV = 2;
  List<t_variety.Event> _events;
  static const int EVENTS = 3;
  Set<t_variety.Event> _events2;
  static const int EVENTS2 = 4;
  Map<int, t_variety.Event> _eventMap;
  static const int EVENTMAP = 5;
  List<List<int>> _nums;
  static const int NUMS = 6;
  List<int> _enums;
  static const int ENUMS = 7;
  bool _aBoolField = false;
  static const int ABOOLFIELD = 8;
  t_variety.TestingUnions _a_union;
  static const int A_UNION = 9;
  String _typedefOfTypedef;
  static const int TYPEDEFOFTYPEDEF = 10;
  /// This is a docstring comment for a deprecated field that has been spread
  /// across two lines.
  /// Deprecated: use something else
  @deprecated
  bool _depr = false;
  static const int DEPR = 11;
  /// Deprecated: use something else
  @deprecated
  Uint8List _deprBinary;
  static const int DEPRBINARY = 12;
  /// Deprecated: use something else
  @deprecated
  List<bool> _deprList;
  static const int DEPRLIST = 13;
  List<t_variety.Event> _eventsDefault;
  static const int EVENTSDEFAULT = 14;
  Map<int, t_variety.Event> _eventMapDefault;
  static const int EVENTMAPDEFAULT = 15;
  Set<t_variety.Event> _eventSetDefault;
  static const int EVENTSETDEFAULT = 16;
  List<t_variety.Event> _eventsRequired;
  static const int EVENTSREQUIRED = 17;
  Map<int, t_variety.Event> _eventMapRequired;
  static const int EVENTMAPREQUIRED = 18;
  Set<t_variety.Event> _eventSetRequired;
  static const int EVENTSETREQUIRED = 19;

  bool __isset_iD = false;
  bool __isset_aBoolField = false;
  bool __isset_depr = false;

  EventWrapper() {
    this._eventsDefault = [
    ];
    this._eventMapDefault = {
    };
    this._eventSetDefault = Set<t_variety.Event>.from([
    ]);
    this._eventsRequired = [
    ];
    this._eventMapRequired = {
    };
    this._eventSetRequired = Set<t_variety.Event>.from([
    ]);
  }

  int get iD => this._iD;

  set iD(int iD) {
    this._iD = iD;
    this.__isset_iD = true;
  }

  bool isSetID() => this.__isset_iD;

  unsetID() {
    this.__isset_iD = false;
  }

  t_variety.Event get ev => this._ev;

  set ev(t_variety.Event ev) {
    this._ev = ev;
  }

  bool isSetEv() => this.ev != null;

  unsetEv() {
    this.ev = null;
  }

  List<t_variety.Event> get events => this._events;

  set events(List<t_variety.Event> events) {
    this._events = events;
  }

  bool isSetEvents() => this.events != null;

  unsetEvents() {
    this.events = null;
  }

  Set<t_variety.Event> get events2 => this._events2;

  set events2(Set<t_variety.Event> events2) {
    this._events2 = events2;
  }

  bool isSetEvents2() => this.events2 != null;

  unsetEvents2() {
    this.events2 = null;
  }

  Map<int, t_variety.Event> get eventMap => this._eventMap;

  set eventMap(Map<int, t_variety.Event> eventMap) {
    this._eventMap = eventMap;
  }

  bool isSetEventMap() => this.eventMap != null;

  unsetEventMap() {
    this.eventMap = null;
  }

  List<List<int>> get nums => this._nums;

  set nums(List<List<int>> nums) {
    this._nums = nums;
  }

  bool isSetNums() => this.nums != null;

  unsetNums() {
    this.nums = null;
  }

  List<int> get enums => this._enums;

  set enums(List<int> enums) {
    this._enums = enums;
  }

  bool isSetEnums() => this.enums != null;

  unsetEnums() {
    this.enums = null;
  }

  bool get aBoolField => this._aBoolField;

  set aBoolField(bool aBoolField) {
    this._aBoolField = aBoolField;
    this.__isset_aBoolField = true;
  }

  bool isSetABoolField() => this.__isset_aBoolField;

  unsetABoolField() {
    this.__isset_aBoolField = false;
  }

  t_variety.TestingUnions get a_union => this._a_union;

  set a_union(t_variety.TestingUnions a_union) {
    this._a_union = a_union;
  }

  bool isSetA_union() => this.a_union != null;

  unsetA_union() {
    this.a_union = null;
  }

  String get typedefOfTypedef => this._typedefOfTypedef;

  set typedefOfTypedef(String typedefOfTypedef) {
    this._typedefOfTypedef = typedefOfTypedef;
  }

  bool isSetTypedefOfTypedef() => this.typedefOfTypedef != null;

  unsetTypedefOfTypedef() {
    this.typedefOfTypedef = null;
  }

  /// This is a docstring comment for a deprecated field that has been spread
  /// across two lines.
  /// Deprecated: use something else
  @deprecated
  bool get depr => this._depr;

  /// This is a docstring comment for a deprecated field that has been spread
  /// across two lines.
  /// Deprecated: use something else
  @deprecated
  set depr(bool depr) {
    this._depr = depr;
    this.__isset_depr = true;
  }

  @deprecated  bool isSetDepr() => this.__isset_depr;

  unsetDepr() {
    this.__isset_depr = false;
  }

  /// Deprecated: use something else
  @deprecated
  Uint8List get deprBinary => this._deprBinary;

  /// Deprecated: use something else
  @deprecated
  set deprBinary(Uint8List deprBinary) {
    this._deprBinary = deprBinary;
  }

  @deprecated  bool isSetDeprBinary() => this.deprBinary != null;

  unsetDeprBinary() {
    // ignore: deprecated_member_use
    this.deprBinary = null;
  }

  /// Deprecated: use something else
  @deprecated
  List<bool> get deprList => this._deprList;

  /// Deprecated: use something else
  @deprecated
  set deprList(List<bool> deprList) {
    this._deprList = deprList;
  }

  @deprecated  bool isSetDeprList() => this.deprList != null;

  unsetDeprList() {
    // ignore: deprecated_member_use
    this.deprList = null;
  }

  List<t_variety.Event> get eventsDefault => this._eventsDefault;

  set eventsDefault(List<t_variety.Event> eventsDefault) {
    this._eventsDefault = eventsDefault;
  }

  bool isSetEventsDefault() => this.eventsDefault != null;

  unsetEventsDefault() {
    this.eventsDefault = null;
  }

  Map<int, t_variety.Event> get eventMapDefault => this._eventMapDefault;

  set eventMapDefault(Map<int, t_variety.Event> eventMapDefault) {
    this._eventMapDefault = eventMapDefault;
  }

  bool isSetEventMapDefault() => this.eventMapDefault != null;

  unsetEventMapDefault() {
    this.eventMapDefault = null;
  }

  Set<t_variety.Event> get eventSetDefault => this._eventSetDefault;

  set eventSetDefault(Set<t_variety.Event> eventSetDefault) {
    this._eventSetDefault = eventSetDefault;
  }

  bool isSetEventSetDefault() => this.eventSetDefault != null;

  unsetEventSetDefault() {
    this.eventSetDefault = null;
  }

  List<t_variety.Event> get eventsRequired => this._eventsRequired;

  set eventsRequired(List<t_variety.Event> eventsRequired) {
    this._eventsRequired = eventsRequired;
  }

  bool isSetEventsRequired() => this.eventsRequired != null;

  unsetEventsRequired() {
    this.eventsRequired = null;
  }

  Map<int, t_variety.Event> get eventMapRequired => this._eventMapRequired;

  set eventMapRequired(Map<int, t_variety.Event> eventMapRequired) {
    this._eventMapRequired = eventMapRequired;
  }

  bool isSetEventMapRequired() => this.eventMapRequired != null;

  unsetEventMapRequired() {
    this.eventMapRequired = null;
  }

  Set<t_variety.Event> get eventSetRequired => this._eventSetRequired;

  set eventSetRequired(Set<t_variety.Event> eventSetRequired) {
    this._eventSetRequired = eventSetRequired;
  }

  bool isSetEventSetRequired() => this.eventSetRequired != null;

  unsetEventSetRequired() {
    this.eventSetRequired = null;
  }

  @override
  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ID:
        return this.iD;
      case EV:
        return this.ev;
      case EVENTS:
        return this.events;
      case EVENTS2:
        return this.events2;
      case EVENTMAP:
        return this.eventMap;
      case NUMS:
        return this.nums;
      case ENUMS:
        return this.enums;
      case ABOOLFIELD:
        return this.aBoolField;
      case A_UNION:
        return this.a_union;
      case TYPEDEFOFTYPEDEF:
        return this.typedefOfTypedef;
      case DEPR:
        // ignore: deprecated_member_use
        return this.depr;
      case DEPRBINARY:
        // ignore: deprecated_member_use
        return this.deprBinary;
      case DEPRLIST:
        // ignore: deprecated_member_use
        return this.deprList;
      case EVENTSDEFAULT:
        return this.eventsDefault;
      case EVENTMAPDEFAULT:
        return this.eventMapDefault;
      case EVENTSETDEFAULT:
        return this.eventSetDefault;
      case EVENTSREQUIRED:
        return this.eventsRequired;
      case EVENTMAPREQUIRED:
        return this.eventMapRequired;
      case EVENTSETREQUIRED:
        return this.eventSetRequired;
      default:
        throw ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  @override
  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case ID:
        if (value == null) {
          unsetID();
        } else {
          this.iD = value as int;
        }
        break;

      case EV:
        this.ev = value as t_variety.Event;
        break;

      case EVENTS:
        this.events = value as List<t_variety.Event>;
        break;

      case EVENTS2:
        this.events2 = value as Set<t_variety.Event>;
        break;

      case EVENTMAP:
        this.eventMap = value as Map<int, t_variety.Event>;
        break;

      case NUMS:
        this.nums = value as List<List<int>>;
        break;

      case ENUMS:
        this.enums = value as List<int>;
        break;

      case ABOOLFIELD:
        if (value == null) {
          unsetABoolField();
        } else {
          this.aBoolField = value as bool;
        }
        break;

      case A_UNION:
        this.a_union = value as t_variety.TestingUnions;
        break;

      case TYPEDEFOFTYPEDEF:
        this.typedefOfTypedef = value as String;
        break;

      case DEPR:
        if (value == null) {
          unsetDepr();
        } else {
          // ignore: deprecated_member_use
          this.depr = value as bool;
        }
        break;

      case DEPRBINARY:
        // ignore: deprecated_member_use
        this.deprBinary = value as Uint8List;
        break;

      case DEPRLIST:
        // ignore: deprecated_member_use
        this.deprList = value as List<bool>;
        break;

      case EVENTSDEFAULT:
        this.eventsDefault = value as List<t_variety.Event>;
        break;

      case EVENTMAPDEFAULT:
        this.eventMapDefault = value as Map<int, t_variety.Event>;
        break;

      case EVENTSETDEFAULT:
        this.eventSetDefault = value as Set<t_variety.Event>;
        break;

      case EVENTSREQUIRED:
        this.eventsRequired = value as List<t_variety.Event>;
        break;

      case EVENTMAPREQUIRED:
        this.eventMapRequired = value as Map<int, t_variety.Event>;
        break;

      case EVENTSETREQUIRED:
        this.eventSetRequired = value as Set<t_variety.Event>;
        break;

      default:
        throw ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  @override
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ID:
        return isSetID();
      case ABOOLFIELD:
        return isSetABoolField();
      case DEPR:
        // ignore: deprecated_member_use
        return isSetDepr();
    }
    return getFieldValue(fieldID) != null;
  }

  @override
  read(thrift.TProtocol iprot) {
    iprot.readStructBegin();
    for (thrift.TField field = iprot.readFieldBegin();
        field.type != thrift.TType.STOP;
        field = iprot.readFieldBegin()) {
      switch (field.id) {
        case ID:
          if (field.type == thrift.TType.I64) {
            this.iD = iprot.readI64();
            this.__isset_iD = true;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EV:
          if (field.type == thrift.TType.STRUCT) {
            final elem51 = t_variety.Event();
            this.ev = elem51;
            elem51.read(iprot);
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTS:
          if (field.type == thrift.TType.LIST) {
            thrift.TList elem52 = iprot.readListBegin();
            final elem56 = <t_variety.Event>[];
            for(int elem55 = 0; elem55 < elem52.length; ++elem55) {
              final elem54 = t_variety.Event();
              t_variety.Event elem53 = elem54;
              elem54.read(iprot);
              elem56.add(elem53);
            }
            iprot.readListEnd();
            this.events = elem56;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTS2:
          if (field.type == thrift.TType.SET) {
            thrift.TSet elem57 = iprot.readSetBegin();
            final elem61 = <t_variety.Event>{};
            for(int elem60 = 0; elem60 < elem57.length; ++elem60) {
              final elem59 = t_variety.Event();
              t_variety.Event elem58 = elem59;
              elem59.read(iprot);
              elem61.add(elem58);
            }
            iprot.readSetEnd();
            this.events2 = elem61;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTMAP:
          if (field.type == thrift.TType.MAP) {
            thrift.TMap elem62 = iprot.readMapBegin();
            final elem66 = <int, t_variety.Event>{};
            for(int elem65 = 0; elem65 < elem62.length; ++elem65) {
              int elem67 = iprot.readI64();
              final elem64 = t_variety.Event();
              t_variety.Event elem63 = elem64;
              elem64.read(iprot);
              elem66[elem67] = elem63;
            }
            iprot.readMapEnd();
            this.eventMap = elem66;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case NUMS:
          if (field.type == thrift.TType.LIST) {
            thrift.TList elem68 = iprot.readListBegin();
            final elem74 = <List<int>>[];
            for(int elem73 = 0; elem73 < elem68.length; ++elem73) {
              thrift.TList elem70 = iprot.readListBegin();
              final elem69 = <int>[];
              for(int elem72 = 0; elem72 < elem70.length; ++elem72) {
                int elem71 = iprot.readI32();
                elem69.add(elem71);
              }
              iprot.readListEnd();
              elem74.add(elem69);
            }
            iprot.readListEnd();
            this.nums = elem74;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ENUMS:
          if (field.type == thrift.TType.LIST) {
            thrift.TList elem75 = iprot.readListBegin();
            final elem78 = <int>[];
            for(int elem77 = 0; elem77 < elem75.length; ++elem77) {
              int elem76 = iprot.readI32();
              elem78.add(elem76);
            }
            iprot.readListEnd();
            this.enums = elem78;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ABOOLFIELD:
          if (field.type == thrift.TType.BOOL) {
            this.aBoolField = iprot.readBool();
            this.__isset_aBoolField = true;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case A_UNION:
          if (field.type == thrift.TType.STRUCT) {
            final elem79 = t_variety.TestingUnions();
            this.a_union = elem79;
            elem79.read(iprot);
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case TYPEDEFOFTYPEDEF:
          if (field.type == thrift.TType.STRING) {
            this.typedefOfTypedef = iprot.readString();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DEPR:
          if (field.type == thrift.TType.BOOL) {
            // ignore: deprecated_member_use
            this.depr = iprot.readBool();
            this.__isset_depr = true;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DEPRBINARY:
          if (field.type == thrift.TType.STRING) {
            // ignore: deprecated_member_use
            this.deprBinary = iprot.readBinary();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DEPRLIST:
          if (field.type == thrift.TType.LIST) {
            thrift.TList elem80 = iprot.readListBegin();
            // ignore: deprecated_member_use
            final elem83 = <bool>[];
            for(int elem82 = 0; elem82 < elem80.length; ++elem82) {
              bool elem81 = iprot.readBool();
              // ignore: deprecated_member_use
              elem83.add(elem81);
            }
            iprot.readListEnd();
            this.deprList = elem83;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTSDEFAULT:
          if (field.type == thrift.TType.LIST) {
            thrift.TList elem84 = iprot.readListBegin();
            final elem88 = <t_variety.Event>[];
            for(int elem87 = 0; elem87 < elem84.length; ++elem87) {
              final elem86 = t_variety.Event();
              t_variety.Event elem85 = elem86;
              elem86.read(iprot);
              elem88.add(elem85);
            }
            iprot.readListEnd();
            this.eventsDefault = elem88;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTMAPDEFAULT:
          if (field.type == thrift.TType.MAP) {
            thrift.TMap elem89 = iprot.readMapBegin();
            final elem93 = <int, t_variety.Event>{};
            for(int elem92 = 0; elem92 < elem89.length; ++elem92) {
              int elem94 = iprot.readI64();
              final elem91 = t_variety.Event();
              t_variety.Event elem90 = elem91;
              elem91.read(iprot);
              elem93[elem94] = elem90;
            }
            iprot.readMapEnd();
            this.eventMapDefault = elem93;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTSETDEFAULT:
          if (field.type == thrift.TType.SET) {
            thrift.TSet elem95 = iprot.readSetBegin();
            final elem99 = <t_variety.Event>{};
            for(int elem98 = 0; elem98 < elem95.length; ++elem98) {
              final elem97 = t_variety.Event();
              t_variety.Event elem96 = elem97;
              elem97.read(iprot);
              elem99.add(elem96);
            }
            iprot.readSetEnd();
            this.eventSetDefault = elem99;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTSREQUIRED:
          if (field.type == thrift.TType.LIST) {
            thrift.TList elem100 = iprot.readListBegin();
            final elem104 = <t_variety.Event>[];
            for(int elem103 = 0; elem103 < elem100.length; ++elem103) {
              final elem102 = t_variety.Event();
              t_variety.Event elem101 = elem102;
              elem102.read(iprot);
              elem104.add(elem101);
            }
            iprot.readListEnd();
            this.eventsRequired = elem104;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTMAPREQUIRED:
          if (field.type == thrift.TType.MAP) {
            thrift.TMap elem105 = iprot.readMapBegin();
            final elem109 = <int, t_variety.Event>{};
            for(int elem108 = 0; elem108 < elem105.length; ++elem108) {
              int elem110 = iprot.readI64();
              final elem107 = t_variety.Event();
              t_variety.Event elem106 = elem107;
              elem107.read(iprot);
              elem109[elem110] = elem106;
            }
            iprot.readMapEnd();
            this.eventMapRequired = elem109;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENTSETREQUIRED:
          if (field.type == thrift.TType.SET) {
            thrift.TSet elem111 = iprot.readSetBegin();
            final elem115 = <t_variety.Event>{};
            for(int elem114 = 0; elem114 < elem111.length; ++elem114) {
              final elem113 = t_variety.Event();
              t_variety.Event elem112 = elem113;
              elem113.read(iprot);
              elem115.add(elem112);
            }
            iprot.readSetEnd();
            this.eventSetRequired = elem115;
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          thrift.TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    validate();
  }

  @override
  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    final elem116 = iD;
    if (isSetID()) {
      oprot.writeFieldBegin(_ID_FIELD_DESC);
      oprot.writeI64(elem116);
      oprot.writeFieldEnd();
    }
    final elem117 = ev;
    if (elem117 != null) {
      oprot.writeFieldBegin(_EV_FIELD_DESC);
      elem117.write(oprot);
      oprot.writeFieldEnd();
    }
    final elem118 = events;
    if (elem118 != null) {
      oprot.writeFieldBegin(_EVENTS_FIELD_DESC);
      oprot.writeListBegin(thrift.TList(thrift.TType.STRUCT, elem118.length));
      for(var elem119 in elem118) {
        elem119.write(oprot);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    final elem120 = events2;
    if (elem120 != null) {
      oprot.writeFieldBegin(_EVENTS2_FIELD_DESC);
      oprot.writeSetBegin(thrift.TSet(thrift.TType.STRUCT, elem120.length));
      for(var elem121 in elem120) {
        elem121.write(oprot);
      }
      oprot.writeSetEnd();
      oprot.writeFieldEnd();
    }
    final elem122 = eventMap;
    if (elem122 != null) {
      oprot.writeFieldBegin(_EVENT_MAP_FIELD_DESC);
      oprot.writeMapBegin(thrift.TMap(thrift.TType.I64, thrift.TType.STRUCT, elem122.length));
      for(var entry in elem122.entries) {
        oprot.writeI64(entry.key);
        entry.value.write(oprot);
      }
      oprot.writeMapEnd();
      oprot.writeFieldEnd();
    }
    final elem123 = nums;
    if (elem123 != null) {
      oprot.writeFieldBegin(_NUMS_FIELD_DESC);
      oprot.writeListBegin(thrift.TList(thrift.TType.LIST, elem123.length));
      for(var elem124 in elem123) {
        oprot.writeListBegin(thrift.TList(thrift.TType.I32, elem124.length));
        for(var elem125 in elem124) {
          oprot.writeI32(elem125);
        }
        oprot.writeListEnd();
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    final elem126 = enums;
    if (elem126 != null) {
      oprot.writeFieldBegin(_ENUMS_FIELD_DESC);
      oprot.writeListBegin(thrift.TList(thrift.TType.I32, elem126.length));
      for(var elem127 in elem126) {
        oprot.writeI32(elem127);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    final elem128 = aBoolField;
    oprot.writeFieldBegin(_A_BOOL_FIELD_FIELD_DESC);
    oprot.writeBool(elem128);
    oprot.writeFieldEnd();
    final elem129 = a_union;
    if (elem129 != null) {
      oprot.writeFieldBegin(_A_UNION_FIELD_DESC);
      elem129.write(oprot);
      oprot.writeFieldEnd();
    }
    final elem130 = typedefOfTypedef;
    if (elem130 != null) {
      oprot.writeFieldBegin(_TYPEDEF_OF_TYPEDEF_FIELD_DESC);
      oprot.writeString(elem130);
      oprot.writeFieldEnd();
    }
    final elem131 = depr;
    oprot.writeFieldBegin(_DEPR_FIELD_DESC);
    oprot.writeBool(elem131);
    oprot.writeFieldEnd();
    final elem132 = deprBinary;
    // ignore: deprecated_member_use
    if (elem132 != null) {
      oprot.writeFieldBegin(_DEPR_BINARY_FIELD_DESC);
      oprot.writeBinary(elem132);
      oprot.writeFieldEnd();
    }
    final elem133 = deprList;
    // ignore: deprecated_member_use
    if (elem133 != null) {
      oprot.writeFieldBegin(_DEPR_LIST_FIELD_DESC);
      oprot.writeListBegin(thrift.TList(thrift.TType.BOOL, elem133.length));
      for(var elem134 in elem133) {
        oprot.writeBool(elem134);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    final elem135 = eventsDefault;
    if (isSetEventsDefault() && elem135 != null) {
      oprot.writeFieldBegin(_EVENTS_DEFAULT_FIELD_DESC);
      oprot.writeListBegin(thrift.TList(thrift.TType.STRUCT, elem135.length));
      for(var elem136 in elem135) {
        elem136.write(oprot);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    final elem137 = eventMapDefault;
    if (isSetEventMapDefault() && elem137 != null) {
      oprot.writeFieldBegin(_EVENT_MAP_DEFAULT_FIELD_DESC);
      oprot.writeMapBegin(thrift.TMap(thrift.TType.I64, thrift.TType.STRUCT, elem137.length));
      for(var entry in elem137.entries) {
        oprot.writeI64(entry.key);
        entry.value.write(oprot);
      }
      oprot.writeMapEnd();
      oprot.writeFieldEnd();
    }
    final elem138 = eventSetDefault;
    if (isSetEventSetDefault() && elem138 != null) {
      oprot.writeFieldBegin(_EVENT_SET_DEFAULT_FIELD_DESC);
      oprot.writeSetBegin(thrift.TSet(thrift.TType.STRUCT, elem138.length));
      for(var elem139 in elem138) {
        elem139.write(oprot);
      }
      oprot.writeSetEnd();
      oprot.writeFieldEnd();
    }
    final elem140 = eventsRequired;
    if (elem140 != null) {
      oprot.writeFieldBegin(_EVENTS_REQUIRED_FIELD_DESC);
      oprot.writeListBegin(thrift.TList(thrift.TType.STRUCT, elem140.length));
      for(var elem141 in elem140) {
        elem141.write(oprot);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    final elem142 = eventMapRequired;
    if (elem142 != null) {
      oprot.writeFieldBegin(_EVENT_MAP_REQUIRED_FIELD_DESC);
      oprot.writeMapBegin(thrift.TMap(thrift.TType.I64, thrift.TType.STRUCT, elem142.length));
      for(var entry in elem142.entries) {
        oprot.writeI64(entry.key);
        entry.value.write(oprot);
      }
      oprot.writeMapEnd();
      oprot.writeFieldEnd();
    }
    final elem143 = eventSetRequired;
    if (elem143 != null) {
      oprot.writeFieldBegin(_EVENT_SET_REQUIRED_FIELD_DESC);
      oprot.writeSetBegin(thrift.TSet(thrift.TType.STRUCT, elem143.length));
      for(var elem144 in elem143) {
        elem144.write(oprot);
      }
      oprot.writeSetEnd();
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  @override
  String toString() {
    StringBuffer ret = StringBuffer('EventWrapper(');

    if (isSetID()) {
      ret.write('iD:');
      ret.write(this.iD);
    }

    ret.write(', ');
    ret.write('ev:');
    if (this.ev == null) {
      ret.write('null');
    } else {
      ret.write(this.ev);
    }

    ret.write(', ');
    ret.write('events:');
    if (this.events == null) {
      ret.write('null');
    } else {
      ret.write(this.events);
    }

    ret.write(', ');
    ret.write('events2:');
    if (this.events2 == null) {
      ret.write('null');
    } else {
      ret.write(this.events2);
    }

    ret.write(', ');
    ret.write('eventMap:');
    if (this.eventMap == null) {
      ret.write('null');
    } else {
      ret.write(this.eventMap);
    }

    ret.write(', ');
    ret.write('nums:');
    if (this.nums == null) {
      ret.write('null');
    } else {
      ret.write(this.nums);
    }

    ret.write(', ');
    ret.write('enums:');
    if (this.enums == null) {
      ret.write('null');
    } else {
      ret.write(this.enums);
    }

    ret.write(', ');
    ret.write('aBoolField:');
    ret.write(this.aBoolField);

    ret.write(', ');
    ret.write('a_union:');
    if (this.a_union == null) {
      ret.write('null');
    } else {
      ret.write(this.a_union);
    }

    ret.write(', ');
    ret.write('typedefOfTypedef:');
    if (this.typedefOfTypedef == null) {
      ret.write('null');
    } else {
      ret.write(this.typedefOfTypedef);
    }

    ret.write(', ');
    ret.write('depr:');
    // ignore: deprecated_member_use
    ret.write(this.depr);

    ret.write(', ');
    ret.write('deprBinary:');
    // ignore: deprecated_member_use
    if (this.deprBinary == null) {
      ret.write('null');
    } else {
      ret.write('BINARY');
    }

    ret.write(', ');
    ret.write('deprList:');
    // ignore: deprecated_member_use
    if (this.deprList == null) {
      ret.write('null');
    } else {
      // ignore: deprecated_member_use
      ret.write(this.deprList);
    }

    if (isSetEventsDefault()) {
      ret.write(', ');
      ret.write('eventsDefault:');
      if (this.eventsDefault == null) {
        ret.write('null');
      } else {
        ret.write(this.eventsDefault);
      }
    }

    if (isSetEventMapDefault()) {
      ret.write(', ');
      ret.write('eventMapDefault:');
      if (this.eventMapDefault == null) {
        ret.write('null');
      } else {
        ret.write(this.eventMapDefault);
      }
    }

    if (isSetEventSetDefault()) {
      ret.write(', ');
      ret.write('eventSetDefault:');
      if (this.eventSetDefault == null) {
        ret.write('null');
      } else {
        ret.write(this.eventSetDefault);
      }
    }

    ret.write(', ');
    ret.write('eventsRequired:');
    if (this.eventsRequired == null) {
      ret.write('null');
    } else {
      ret.write(this.eventsRequired);
    }

    ret.write(', ');
    ret.write('eventMapRequired:');
    if (this.eventMapRequired == null) {
      ret.write('null');
    } else {
      ret.write(this.eventMapRequired);
    }

    ret.write(', ');
    ret.write('eventSetRequired:');
    if (this.eventSetRequired == null) {
      ret.write('null');
    } else {
      ret.write(this.eventSetRequired);
    }

    ret.write(')');

    return ret.toString();
  }

  @override
  bool operator ==(Object o) {
    if (o is EventWrapper) {
      return this.iD == o.iD &&
        this.ev == o.ev &&
        DeepCollectionEquality().equals(this.events, o.events) &&
        DeepCollectionEquality().equals(this.events2, o.events2) &&
        DeepCollectionEquality().equals(this.eventMap, o.eventMap) &&
        DeepCollectionEquality().equals(this.nums, o.nums) &&
        DeepCollectionEquality().equals(this.enums, o.enums) &&
        this.aBoolField == o.aBoolField &&
        this.a_union == o.a_union &&
        this.typedefOfTypedef == o.typedefOfTypedef &&
        // ignore: deprecated_member_use
        this.depr == o.depr &&
        // ignore: deprecated_member_use
        this.deprBinary == o.deprBinary &&
        // ignore: deprecated_member_use
        DeepCollectionEquality().equals(this.deprList, o.deprList) &&
        DeepCollectionEquality().equals(this.eventsDefault, o.eventsDefault) &&
        DeepCollectionEquality().equals(this.eventMapDefault, o.eventMapDefault) &&
        DeepCollectionEquality().equals(this.eventSetDefault, o.eventSetDefault) &&
        DeepCollectionEquality().equals(this.eventsRequired, o.eventsRequired) &&
        DeepCollectionEquality().equals(this.eventMapRequired, o.eventMapRequired) &&
        DeepCollectionEquality().equals(this.eventSetRequired, o.eventSetRequired);
    }
    return false;
  }

  @override
  int get hashCode {
    var value = 17;
    value = (value * 31) ^ this.iD.hashCode;
    value = (value * 31) ^ this.ev.hashCode;
    value = (value * 31) ^ DeepCollectionEquality().hash(this.events);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.events2);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.eventMap);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.nums);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.enums);
    value = (value * 31) ^ this.aBoolField.hashCode;
    value = (value * 31) ^ this.a_union.hashCode;
    value = (value * 31) ^ this.typedefOfTypedef.hashCode;
    // ignore: deprecated_member_use
    value = (value * 31) ^ this.depr.hashCode;
    // ignore: deprecated_member_use
    value = (value * 31) ^ this.deprBinary.hashCode;
    // ignore: deprecated_member_use
    value = (value * 31) ^ DeepCollectionEquality().hash(this.deprList);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.eventsDefault);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.eventMapDefault);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.eventSetDefault);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.eventsRequired);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.eventMapRequired);
    value = (value * 31) ^ DeepCollectionEquality().hash(this.eventSetRequired);
    return value;
  }

  EventWrapper clone({
    int iD,
    t_variety.Event ev,
    List<t_variety.Event> events,
    Set<t_variety.Event> events2,
    Map<int, t_variety.Event> eventMap,
    List<List<int>> nums,
    List<int> enums,
    bool aBoolField,
    t_variety.TestingUnions a_union,
    String typedefOfTypedef,
    // ignore: deprecated_member_use
    bool depr,
    // ignore: deprecated_member_use
    Uint8List deprBinary,
    // ignore: deprecated_member_use
    List<bool> deprList,
    List<t_variety.Event> eventsDefault,
    Map<int, t_variety.Event> eventMapDefault,
    Set<t_variety.Event> eventSetDefault,
    List<t_variety.Event> eventsRequired,
    Map<int, t_variety.Event> eventMapRequired,
    Set<t_variety.Event> eventSetRequired,
  }) {
    return EventWrapper()
      ..iD = iD ?? this.iD
      ..ev = ev ?? this.ev
      ..events = events ?? this.events
      ..events2 = events2 ?? this.events2
      ..eventMap = eventMap ?? this.eventMap
      ..nums = nums ?? this.nums
      ..enums = enums ?? this.enums
      ..aBoolField = aBoolField ?? this.aBoolField
      ..a_union = a_union ?? this.a_union
      ..typedefOfTypedef = typedefOfTypedef ?? this.typedefOfTypedef
      // ignore: deprecated_member_use
      ..depr = depr ?? this.depr
      // ignore: deprecated_member_use
      ..deprBinary = deprBinary ?? this.deprBinary
      // ignore: deprecated_member_use
      ..deprList = deprList ?? this.deprList
      ..eventsDefault = eventsDefault ?? this.eventsDefault
      ..eventMapDefault = eventMapDefault ?? this.eventMapDefault
      ..eventSetDefault = eventSetDefault ?? this.eventSetDefault
      ..eventsRequired = eventsRequired ?? this.eventsRequired
      ..eventMapRequired = eventMapRequired ?? this.eventMapRequired
      ..eventSetRequired = eventSetRequired ?? this.eventSetRequired;
  }

  validate() {
    // check for required fields
    if (this.ev == null) {
      throw thrift.TProtocolError(thrift.TProtocolErrorType.INVALID_DATA, "Required field 'ev' was not present in struct EventWrapper");
    }
    if (this.eventsRequired == null) {
      throw thrift.TProtocolError(thrift.TProtocolErrorType.INVALID_DATA, "Required field 'eventsRequired' was not present in struct EventWrapper");
    }
    if (this.eventMapRequired == null) {
      throw thrift.TProtocolError(thrift.TProtocolErrorType.INVALID_DATA, "Required field 'eventMapRequired' was not present in struct EventWrapper");
    }
    if (this.eventSetRequired == null) {
      throw thrift.TProtocolError(thrift.TProtocolErrorType.INVALID_DATA, "Required field 'eventSetRequired' was not present in struct EventWrapper");
    }
  }
}
