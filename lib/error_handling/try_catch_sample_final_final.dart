class AreaModel {
  int areaId;
  AreaModel(this.areaId);
}

class RestaurantModel {
  int id;
  String name;
  RestaurantModel(this.id, this.name);
}

double getBestDealByRestaurantId(int id) {
  // Implement the logic to fetch best deal by restaurant ID
  // For now, just return a mock value
  return 10.0;
}

AreaModel getArea() {
  // Implement the logic to fetch area
  // For now, just return a mock value
  return AreaModel(1);
}

List<RestaurantModel> getRestaurantsByArea(int areaId) {
  // Implement the logic to fetch restaurants by area ID
  // For now, just return some mock values
  return [
    RestaurantModel(1, 'Restaurant 1'),
    RestaurantModel(2, 'Restaurant 2')
  ];
}

void main() {
  final AreaModel area = getArea();
  final restaurants = getRestaurantsByArea(area.areaId);

  restaurants.forEach((restaurant) {
    final bestDeal = getBestDealByRestaurantId(restaurant.id);
    print('Best deal for ${restaurant.name} is $bestDeal');
  });
}
