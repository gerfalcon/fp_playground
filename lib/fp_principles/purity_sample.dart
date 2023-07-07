// ignore_for_file: avoid_print

void main() {
  /// Example 1.
  print(add(1, 2)); // Prints 3

  /// Example 2.
  print(isEven(2)); // Prints true
  print(isEven(3)); // Prints false
}

/// Example 1.
/// Pure functions are those that given the same input, will always return the same output, and do not have any observable side effect.
/// Here's an example of a pure function in Dart:
int add(int a, int b) {
  return a + b; // Pure function
}

/// Example 2.
/// Here's an example of an impure function in Dart:
bool isEven(int n) {
  return n % 2 == 0; // Pure function
}
