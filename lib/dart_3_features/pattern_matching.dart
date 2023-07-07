void main() {
  const bool b = false;
  switch (b) {
    case true:
      print('yes');
    case false:
      print('no');
  }
}

// Example 2.
String describeBools(bool b1, bool b2) => switch ((b1, b2)) {
      (true, true) => 'both true',
      (false, false) => 'both false',
      (true, false) => 'one of each',
      (false, true) => 'one of each',
    };
