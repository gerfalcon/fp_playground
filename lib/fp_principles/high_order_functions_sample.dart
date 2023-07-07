// ignore_for_file: avoid_print

void main() {
  /// Example 1.
  forEach([1, 2, 3], print); // Prints 1, 2, 3

  /// Example 2.
  printNumbers([1, 2, 3], printDouble); // Prints 2, 4, 6

  /// Example 3.
  var doubleValue = applyMultiplier(2);
  print(doubleValue(5)); // Prints 10
}

/// Example 1.
/// In this code snippet, we can see the usage of higher-order functions.
/// [forEach] is a function that takes another function 'action' as a parameter.
void forEach(List items, Function action) {
  for (var item in items) {
    action(item);
  }
}

/// Example 2.
void printNumbers(List<int> list, Function action) {
  for (int item in list) {
    action(item);
  }
}

void printDouble(int item) {
  print(item * 2);
}

/// Example 3.
Function applyMultiplier(int multiplier) {
  return (int value) => value * multiplier;
}
