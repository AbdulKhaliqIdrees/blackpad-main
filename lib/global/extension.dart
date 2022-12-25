import 'constants.dart';

extension IdGenerator on int {
  int get genId {
    return (this - idGen) ~/ 100;
  }
}
