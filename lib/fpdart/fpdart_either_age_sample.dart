// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';

Either<String, String> verifyAge(int age) => age < 18
    ? Either.left('Person of age $age is under 18')
    : Either.right('Person of age $age is 18 or older');

Iterable<Either<String, String>> verifyAges(List<int> ages) =>
    ages.map(verifyAge);

void main() {
  final ages = [17, 18, 20, 16, 21];
  final results = verifyAges(ages);

  for (final result in results) {
    result.fold(
      (left) => print(left),
      (right) => print(right),
    );
  }
}
