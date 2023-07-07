// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';

import 'fpdart_either_fizzbuzz_sample.dart';

void main() {
  /// Try-Catch constructor of [Either]
  Either.tryCatch(() => null, (o, s) => null);

  /// Create an instance of [Either]
  /// Create an instance of [Right]
  final right = Either<String, int>.right(10);
  final right2 = Either<String, int>.of(10);

  /// Create an instance of [Left]
  final left = Either<String, int>.left('none');

  /// Mapping
  /// Map the right value to a [String]
  final mapRight = right.map((a) => '$a');

  /// Map the left value to a [int]
  final mapLeft = right.mapLeft((a) => a.length);

  /// Pattern matching
  final number = parseNumber('invalid');

  /// unwrap error/success with the fold method
  number.fold(
    // same as number.match()
    (exception) => print(exception),
    (value) => print(value),
  );
}
