// Autogenerated by Frugal Compiler (3.16.22)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

// ignore_for_file: unused_import
// ignore_for_file: unused_field
import 'dart:convert' show utf8;
import 'package:fixnum/fixnum.dart' as fixnum;
import 'dart:typed_data' show Uint8List;

import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:thrift/thrift.dart' as thrift;
import 'package:variety/variety.dart' as t_variety;
import 'package:actual_base_dart/actual_base_dart.dart' as t_actual_base_dart;
import 'package:intermediate_include/intermediate_include.dart' as t_intermediate_include;
import 'package:validStructs/validStructs.dart' as t_validStructs;
import 'package:ValidTypes/ValidTypes.dart' as t_ValidTypes;
import 'package:subdir_include_ns/subdir_include_ns.dart' as t_subdir_include_ns;

class VarietyConstants {
  static final int redef_const = t_actual_base_dart.ActualBaseDartConstants.const_i32_from_base;
  static final t_actual_base_dart.thing const_thing = t_variety.thing()
    ..an_id = 1
    ..a_string = "some string";
  static final fixnum.Int64 DEFAULT_ID = fixnum.Int64(-1);
  static final fixnum.Int64 other_default = t_variety.VarietyConstants.DEFAULT_ID;
  static const int thirtyfour = 34;
  static final fixnum.Int64 mini53 = fixnum.Int64(-9007199254740991);
  static final fixnum.Int64 mini53m1 = fixnum.Int64.fromInts(-2097152, 0);
  static final fixnum.Int64 maxi53 = fixnum.Int64(9007199254740991);
  static final fixnum.Int64 maxi53p1 = fixnum.Int64.fromInts(2097152, 0);
  static final fixnum.Int64 mini64 = fixnum.Int64.fromInts(-2147483648, 0);
  static final fixnum.Int64 maxi64 = fixnum.Int64.fromInts(2147483647, 4294967295);
  static const Map<String, String> MAPCONSTANT = const {
    "hello": "world",
    "goodnight": "moon",
  };
  static final Set<String> SETCONSTANT = Set<String>.from([
    "hello",
    "world",
  ]);
  static final t_variety.Event ConstEvent1 = t_variety.Event()
    ..iD = fixnum.Int64(-2)
    ..message = "first one";
  static final t_variety.Event ConstEvent2 = t_variety.Event()
    ..iD = fixnum.Int64(-7)
    ..message = "second one";
  static const List<int> NumsList = const [
    2,
    4,
    7,
    1,
  ];
  static final Set<int> NumsSet = Set<int>.from([
    1,
    3,
    8,
    0,
  ]);
  static final Map<String, t_variety.Event> MAPCONSTANT2 = {
    "hello": t_variety.Event()
      ..iD = fixnum.Int64(-2)
      ..message = "first here",
  };
  static final Uint8List bin_const = Uint8List.fromList(utf8.encode('hello'));
  static const bool true_constant = true;
  static const bool false_constant = false;
  static const int const_hc = 2;
  static const String evil_string = "thin'g\" \"";
  static const String evil_string2 = "th'ing\"ad\"f";
  static final t_variety.TestLowercase const_lower = t_variety.TestLowercase()
    ..lowercaseInt = 2;
}
