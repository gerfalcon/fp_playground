// ignore_for_file: avoid_print
void main() {
  try {
    final result = divide(10, 0);
    print(result);
  } on Exception catch (exception) {
    print(exception);
  }
}

/// Example 1.
/// Divides two numbers.
///
/// Throws a [Exception] if [b] is zero.
num divide(num a, num b) {
  if (b == 0) {
    throw Exception('Cannot divide by zero');
  }
  return a / b;
}
