// ignore_for_file: avoid_print, prefer_function_declarations_over_variables

void main() {
  /// Example 1.
  final Function makeAdderFunction =
      makeAdder(addBy: 5); // makeAdderFunction: Closure: (num) => num
  print(makeAdderFunction(1)); // Prints 6
  print(makeAdderFunction(2)); // Prints 7

  /// Example 2.
  var myCounter = counter(start: 0); // makeAdderFunction: Closure: (num) => num
  print(myCounter()); // Prints 0
  print(myCounter()); // Prints 1
}

Function counter({required int start}) {
  return () => start++;
}

/// Example 1.
/// Here we have a closure. [makeAdder] returns a function that adds 'addBy' to its argument.
/// The returned function maintains access to 'addBy' from the parent scope.
Function makeAdder({required num addBy}) {
  return (num i) => addBy + i;
}

/// Example 2.

/// Example 3.
