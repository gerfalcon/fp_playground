// ignore_for_file: avoid_print
// ignore_for_file: constant_identifier_names

import 'dart:core';

/// Example 1.
final name = 'John';
//name = 'Doe';

class ImmutablePoint {
  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

/// Example 4.
int x = 2;

int sum(int y) => x + y;

int sumOnWorkdays(int x, int y) {
  var today = DateTime.now().weekday;

  if (1 <= today && today <= 5) {
    return x + y;
  } else {
    throw Exception('do not work on weekend');
  }
}

bool canIWorkToday() {
  var today = DateTime.now().weekday;

  if (1 <= today && today <= 5) {
    return true;
  } else {
    throw Exception('do not work on weekend');
  }
}

int sumOnWorkdays2(int x, int y, Function canIWork) {
  if (canIWork()) {
    return x + y;
  } else {
    throw Exception('do not work on weekend');
  }
}

/// Example 5 - Area of the circle
///
const PI = 3.14;

double areaOfCircle1(double radius) {
  return PI * radius * radius;
}

//print(sumOnWorkdays2(1, 2, canIWorkToday));

void main4() {
  List<double> inputs = [-1.0, 1.0, 3.0];

  for (int i = 0; i < inputs.length; ++i) {
    final radius = inputs[i];
    if (radius > 0) {
      final area = areaOfCircle(radius);
      print(area);
    }
  }
}

/// Declaring variables as final
void main2() {
  final String name = "John";
  print(name); // Prints John
  //name = "David";  // This will cause a compile-time error

  const int age = 29;
  print(age); // Output: 25
  //age = 30;  // This will cause a compile-time error
}

void main3() {
  /// Example 2.
  List<int> numbers = [1, 2, 3];
  numbers.add(4); // [1, 2, 3, 4]
  print(numbers);
/*  List<double> inputs = [-1.0, 1.0, 3.0];

  inputs
      .where((input) => input > 0)
      .map((radius) => areaOfCircle(radius, print));*/
}

double calculateArea2(double radius) {
  return PI * radius * radius;
}

double areaOfCircle(double radius) {
  return PI * radius * radius;
}

void main() {
  List<double> inputs = [-1.0, 1.0, 3.0];

  inputs
      .skip(1)
      .where((input) => input > 0)
      .map((radius) => areaOfCircle(radius))
      .map((area) => area.toStringAsFixed(2))
      .toList()
      .take(2)
      .forEach((area) => print(area));
}
