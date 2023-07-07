// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';

/// Fun Example: Functional Fizz-Buzz 😎
void main() {
  final values = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    'not-a-number',
    'invalid',
  ];

  final results = parseFizzBuzzDeclarativeWithTearOff(values).join('\n');
  print(results);

  parseFizzBuzzDeclarativeWithTearOff(values).forEach((result) => result.fold(
        (l) => print(l),
        (r) => print(r),
      ));
}

String fizzBuzz(double value) {
  if (value % 3 == 0 && value % 5 == 0) {
    // multiple of 3 and 5
    return 'fizz buzz';
  } else if (value % 3 == 0) {
    // multiple of 3
    return 'fizz';
  } else if (value % 5 == 0) {
    // multiple of 5
    return 'buzz';
  } else {
    // all other numbers
    return value.toString();
  }
}

Either<FormatException, double> parseNumber(String value) {
  return Either.tryCatch(
    () => double.parse(value),
    (e, _) => e as FormatException,
  );
}

/// Fizzbuzz with Imperative style
Iterable<Either<FormatException, String>> parseFizzBuzzImperative(
    List<String> strings) {
  // all types are declared explicitly for clarity,
  // but we could have used `final` instead:
  List<Either<FormatException, String>> results = [];
  for (String string in strings) {
    // first, parse the input string
    Either<FormatException, double> parsed = parseNumber(string);
    // then, use map to convert valid numbers using [fizzBuzz]
    Either<FormatException, String> result =
        parsed.map((value) => fizzBuzz(value));
    // add the value
    results.add(result);
  }
  return results;
}

/// Fizzbuzz with declarative Functional style
Iterable<Either<FormatException, String>> parseFizzBuzzDeclarative(
        List<String> strings) =>
    strings.map(
      (string) => parseNumber(string).map(
        (value) => fizzBuzz(value),
      ),
    );

/// Fizzbuzz with declarative Functional style with tear-off
Iterable<Either<FormatException, String>> parseFizzBuzzDeclarativeWithTearOff(
        List<String> strings) =>
    strings.map((string) => parseNumber(string).map(fizzBuzz));
