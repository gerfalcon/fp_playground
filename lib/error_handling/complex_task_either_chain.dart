import 'package:fp_sample/error_handling/try_catch_sample_final.dart';
import 'package:fpdart/fpdart.dart';

TaskEither<String, AreaModel> getAreaTaskEither() =>
    TaskEither.tryCatch(() async {
      return const AreaModel(1, 'Area 1', 0.0, 0.0);
    }, (e, s) => '$e');

TaskEither<String, RestaurantModel> getRestaurantByAreaIdTaskEither(
        int areaId) =>
    TaskEither.tryCatch(
      () => Future.delayed(
        const Duration(seconds: 2),
        () => const RestaurantModel(id: 1, name: 'Restaurant 1'),
      ),
      (e, _) => e.toString(),
    );

TaskEither<String, double> getBestDealByRestaurantId(int id) =>
    TaskEither.tryCatch(
      () => Future.delayed(
        const Duration(seconds: 2),
        () => 20.00,
      ),
      (e, _) => e.toString(),
    );

void main() async {
  final task = getAreaTaskEither()
      .flatMap((area) => getRestaurantByAreaIdTaskEither(area.id))
      .flatMap((restaurant) => getBestDealByRestaurantId(restaurant.id));

  final Either<String, double> result = await task.run();
  result.fold(
    (l) => print(l),
    (r) => print(r),
  );
}
