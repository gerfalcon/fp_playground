// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';

Future<Result<AreaModel, Exception>> getArea() async {
  /// Return
  return Future.delayed(const Duration(seconds: 1),
      () => const Success(AreaModel(1, 'Area 1', 0.0, 0.0)));
}

class RestaurantModel {
  final int id;
  final String name;

  const RestaurantModel({
    this.id = 1,
    this.name = "Restaurant",
  });
}

Future<Result<RestaurantModel, Exception>> getRestaurantByAreaId(
    AreaModel area) async {
  return Future.delayed(
      const Duration(seconds: 2),
      () => const Success(
            RestaurantModel(id: 1, name: 'Restaurant 1'),
          ));
}

TaskEither<String, RestaurantModel> getRestaurantByAreaIdTaskEither(
        AreaModel area) =>
    TaskEither.tryCatch(
      () => Future.delayed(
        const Duration(seconds: 2),
        () => const RestaurantModel(id: 1, name: 'Restaurant 1'),
      ),
      (e, _) => e.toString(),
    );

Future<Result<int, Exception>> getBestDealByRestaurantId(
  int restaurant,
) async {
  return Future.delayed(const Duration(seconds: 3), () => const Success(30));
}

Future<Result<int, Exception>> getBestDeal() async {
  final areaResult = await getArea();
  if (areaResult case Success(value: final area)) {
    final restaurantResult = await getRestaurantByAreaId(area);
    return switch (restaurantResult) {
      Success(value: final restaurant) =>
        await getBestDealByRestaurantId(restaurant.id),
      Failure(exception: final _) =>
        Failure(Exception('Error while getting best deal')),
    };
  } else {
    return Failure(Exception('Error while getting best deal'));
  }
}

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

void main3() async {
  try {
    final result = await getArea();
    print(result);
  } on Exception catch (_) {
    print('Error while getting area');
  } catch (e) {
    print('Unexpected error while getting area');
  }
}

/*void main2() async {
  final Result<AreaModel, Exception> result = await getArea();

  final String value = switch (result) {
    Success(value: final area) => area.toString(),
    Failure(exception: final exception) => exception.toString(),
  };
  print(value);
}*/

///   task
//       .mapLeft((l) => 'Error while getting area')
//       .flatMap((area) => TaskEither.of(area.toString()));
void main() async {
  final TaskEither<String, AreaModel> task = getAreaTaskEither();

  final Either<String, AreaModel> result = await task.run();
  result.fold(
    (l) => print(l),
    (r) => print(r),
  );
}

class Constants {
  static const getAreaApi = 'http://dummydomain.com/area';
}

/// remote data source

/// getArea returns the area of the given IP address.
/// Throws an [Exception] if there is an exception while getting the area.
/// Throws a [TypeError] if there is a crucial issue in the mapping.
/// Throws any other error if there is an unexpected error.
TaskEither<String, AreaModel> getAreaTaskEither() =>
    TaskEither.tryCatch(() async {
      return const AreaModel(1, 'Area 1', 0.0, 0.0);
    }, (e, s) => '$e');

Either<Exception, double> parseNumberWithEitherTryCatch(String value) {
  return Either.tryCatch(() => double.parse(value),
      (e, _) => e is FormatException ? e : Exception('Unexpected error'));

/*Future<AreaModel> getArea() async {
  try {
    final uri = Uri.parse(Constants.getAreaApi);
    final response = await http.get(uri);
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        return AreaModel.fromMap(data);
      default:
        throw Exception(response.reasonPhrase);
    }
  } on ParsingException catch (_) {
    rethrow;
  } on TypeError catch (_) {
    rethrow;
  } on Exception catch (_) {
    rethrow;
  } catch (_) {
    rethrow;
  } */
}

class Location {
  late final double lat;
  late final double lon;

  Location.fromMap(Map<String, dynamic> map) {
    lat = map['lat'];
    lon = map['lon'];
  }
}

class AuthorizationException implements Exception {
  const AuthorizationException(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

class NoInternetException implements Exception {
  const NoInternetException(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ServerException implements Exception {
  const ServerException(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ParsingException implements Exception {
  const ParsingException(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

double areaOfCircle() {
  return 0.0;
}

class AreaModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  const AreaModel(this.id, this.name, this.latitude, this.longitude);

  AreaModel.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        latitude = json['latitude'],
        longitude = json['longitude'];
}

/// Create an instance of [Right]
final right = Either<String, int>.of(10);

/// Create an instance of [Left]
final left = Either<String, int>.left('none');

/// Map the right value to a [String]
final mapRight = right.map((a) => '$a');

/// Map the left value to a [int]
final mapLeft = right.mapLeft((a) => a.length);

/// Return [Left] if the function throws an error.
/// Otherwise return [Right].
final tryCatch = Either.tryCatch(
  () => int.parse('invalid'),
  (e, s) => 'Error: $e',
);
