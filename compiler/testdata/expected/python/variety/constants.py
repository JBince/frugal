#
# Autogenerated by Frugal Compiler (3.16.8)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

from thrift.Thrift import TType, TMessageType, TException, TApplicationException
from .ttypes import *

import actual_base.python.ttypes
import actual_base.python.constants

import intermediate_include.ttypes
import intermediate_include.constants

import validStructs.ttypes
import validStructs.constants

import ValidTypes.ttypes
import ValidTypes.constants

import subdir_include.ttypes
import subdir_include.constants

redef_const = actual_base.python.constants.const_i32_from_base
const_thing = actual_base.python.ttypes.thing(**{
    "an_id": 1,
    "a_string": "some string",
})
DEFAULT_ID = -1
other_default = DEFAULT_ID
thirtyfour = 34
MAPCONSTANT = {
    "hello": "world",
    "goodnight": "moon",
}
SETCONSTANT = set([
    "hello",
    "world",
])
ConstEvent1 = Event(**{
    "ID": -2,
    "Message": "first one",
})
ConstEvent2 = Event(**{
    "ID": -7,
    "Message": "second one",
})
NumsList = [
    2,
    4,
    7,
    1,
]
NumsSet = set([
    1,
    3,
    8,
    0,
])
MAPCONSTANT2 = {
    "hello": Event(**{
        "ID": -2,
        "Message": "first here",
    }),
}
bin_const = "hello"
true_constant = True
false_constant = False
const_hc = 2
evil_string = "thin'g\" \""
evil_string2 = "th'ing\"ad\"f"
const_lower = TestLowercase(**{
    "lowercaseInt": 2,
})
