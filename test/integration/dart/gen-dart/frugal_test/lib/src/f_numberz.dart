// Autogenerated by Frugal Compiler (3.16.26)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

enum Numberz {
  ONE,
  TWO,
  THREE,
  FIVE,
  SIX,
  EIGHT,
}

int serializeNumberz(Numberz variant) {
  switch (variant) {
    case Numberz.ONE:
      return 1;
    case Numberz.TWO:
      return 2;
    case Numberz.THREE:
      return 3;
    case Numberz.FIVE:
      return 5;
    case Numberz.SIX:
      return 6;
    case Numberz.EIGHT:
      return 8;
  }
}

Numberz deserializeNumberz(int value) {
  switch (value) {
    case 1:
      return Numberz.ONE;
    case 2:
      return Numberz.TWO;
    case 3:
      return Numberz.THREE;
    case 5:
      return Numberz.FIVE;
    case 6:
      return Numberz.SIX;
    case 8:
      return Numberz.EIGHT;
    default:
      throw thrift.TProtocolError(thrift.TProtocolErrorType.UNKNOWN, "Invalid value '$value' for enum 'Numberz'");  }
}
