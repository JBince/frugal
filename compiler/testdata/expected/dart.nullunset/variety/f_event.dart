// Autogenerated by Frugal Compiler (3.16.23)
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

/// This docstring gets added to the generated code because it has
/// the @ sign.
class Event implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = thrift.TStruct('Event');
  static final thrift.TField _ID_FIELD_DESC = thrift.TField('ID', thrift.TType.I64, 1);
  static final thrift.TField _MESSAGE_FIELD_DESC = thrift.TField('Message', thrift.TType.STRING, 2);
  static final thrift.TField _YE_S__NO_FIELD_DESC = thrift.TField('YES_NO', thrift.TType.BOOL, 3);

  /// ID is a unique identifier for an event.
  int iD = t_variety.VarietyConstants.DEFAULT_ID;
  static const int ID = 1;
  /// Message contains the event payload.
  String message;
  static const int MESSAGE = 2;
  bool yES_NO;
  static const int YES_NO = 3;


  bool isSetID() => this.iD != t_variety.VarietyConstants.DEFAULT_ID;

  unsetID() {
    this.iD = t_variety.VarietyConstants.DEFAULT_ID;
  }

  bool isSetMessage() => this.message != null;

  unsetMessage() {
    this.message = null;
  }

  bool isSetYES_NO() => this.yES_NO != null;

  unsetYES_NO() {
    this.yES_NO = null;
  }

  @override
  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ID:
        return this.iD;
      case MESSAGE:
        return this.message;
      case YES_NO:
        return this.yES_NO;
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

      case MESSAGE:
        if (value == null) {
          unsetMessage();
        } else {
          this.message = value as String;
        }
        break;

      case YES_NO:
        if (value == null) {
          unsetYES_NO();
        } else {
          this.yES_NO = value as bool;
        }
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
      case MESSAGE:
        return isSetMessage();
      case YES_NO:
        return isSetYES_NO();
      default:
        throw ArgumentError("Field $fieldID doesn't exist!");
    }
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
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case MESSAGE:
          if (field.type == thrift.TType.STRING) {
            this.message = iprot.readString();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case YES_NO:
          if (field.type == thrift.TType.BOOL) {
            this.yES_NO = iprot.readBool();
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
    oprot.writeFieldBegin(_ID_FIELD_DESC);
    oprot.writeI64(this.iD);
    oprot.writeFieldEnd();
    if (isSetMessage()) {
      oprot.writeFieldBegin(_MESSAGE_FIELD_DESC);
      oprot.writeString(this.message);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_YE_S__NO_FIELD_DESC);
    oprot.writeBool(this.yES_NO);
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  @override
  String toString() {
    StringBuffer ret = StringBuffer('Event(');

    ret.write('iD:');
    ret.write(this.iD);

    ret.write(', ');
    ret.write('message:');
    if (this.message == null) {
      ret.write('null');
    } else {
      ret.write(this.message);
    }

    ret.write(', ');
    ret.write('yES_NO:');
    ret.write(this.yES_NO);

    ret.write(')');

    return ret.toString();
  }

  @override
  bool operator ==(Object o) {
    if (o is Event) {
      return this.iD == o.iD &&
        this.message == o.message &&
        this.yES_NO == o.yES_NO;
    }
    return false;
  }

  @override
  int get hashCode {
    var value = 17;
    value = (value * 31) ^ this.iD.hashCode;
    value = (value * 31) ^ this.message.hashCode;
    value = (value * 31) ^ this.yES_NO.hashCode;
    return value;
  }

  Event clone({
    int iD,
    String message,
    bool yES_NO,
  }) {
    return Event()
      ..iD = iD ?? this.iD
      ..message = message ?? this.message
      ..yES_NO = yES_NO ?? this.yES_NO;
  }

  validate() {
  }
}
