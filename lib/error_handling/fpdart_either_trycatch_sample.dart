// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';

void main() {
  parseNumberWithTryCatch();

  parseNumberWithEitherTryCatch('not-a-number').fold(
    (l) => print(l),
    (r) => print(r),
  );
}

parseNumberWithTryCatch() {
  try {
    final value = double.parse('not-a-number');
  } on FormatException catch (e) {
    print(e);
  }
}

Either<Exception, double> parseNumberWithEither(String value) {
  try {
    var PI = 4;
    return Either.right(double.parse(value));
  } on Exception catch (e) {
    return Either.left(e);
  } catch (e) {
    return Either.left(const FormatException('Unexpected error'));
  }
}

Either<Exception, double> parseNumberWithEitherTryCatch(String value) {
  return Either.tryCatch(() => double.parse(value),
      (e, _) => e is FormatException ? e : Exception('Unexpected error'));
}
