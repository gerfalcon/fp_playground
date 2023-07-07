// ignore_for_file: avoid_print

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> {
  const Result();
}

/// The [Success] and [Failure] classes above use the final class modifier to prevent further subclassing.
/// To learn more, read: [Class modifiers](https://dart.dev/language/class-modifiers).
final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);

  final E exception;
}

Future<Result<int, Exception>> getArea() async {
  /// Return
  return Future.delayed(const Duration(seconds: 1), () => const Success(1));
}

Future<Result<int, Exception>> getBestDealByRestaurantId(int value) async {
  return Future.delayed(const Duration(seconds: 2), () => const Success(2));
}

Future<Result<int, Exception>> function3(int value) async {
  return Future.delayed(const Duration(seconds: 3), () => const Success(3));
}

/// When the Result type doesn't work well
/// Consider this function that calls three other async functions sequentially:
Future<Result<int, Exception>> complexAsyncWork() async {
  // first async call
  final areaResult = await getArea();
  if (areaResult case Success(value: final area)) {
    // second async call
    final restaurantsResult = await getBestDealByRestaurantId(area);
    return switch (restaurantsResult) {
      // third async call
      Success(value: final restaurants) => await function3(restaurants),
      Failure(exception: final _) => restaurantsResult, // error
    };
  } else {
    return areaResult; // error
  }
}

void main() async {
  final result = await complexAsyncWork();
  final String value = switch (result) {
    Success(value: final value) => value.toString(),
    Failure(exception: final exception) => exception.toString(),
  };
  print(value);
}
