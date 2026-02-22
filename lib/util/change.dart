import 'denominations.dart';

Map<int, int> makeChange(int amount) {
  final Map<int, int> result = {};
  var remaining = amount;

  for (final d in takaDenominations) {
    result[d] = remaining ~/ d;
    remaining = remaining % d;
  }
  return result;
}
