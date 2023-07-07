// Example 1.
const year = (name: 'Best year ever', date: 2023);

final nextYear = (name: year.name, date: year.date + 1);

// Example 2.
const year2 = (name: 'Best year ever', 2023);

final nextYear2 = (name: year2.name, year2.$1 + 1);

// Example 3.
(String, String) getName() {
  var firstName = 'John';
  var lastName = 'Smith';

  return (firstName, lastName);
}

void main() {
  final name = getName();
  print('${name.$1} ${name.$2}');
  // Prints: John Smith

  final (firstName, lastName) = getName();
  print('$lastName $firstName'); // in Hungary🇭🇺
  // Prints: Smith John
}

// Example 4.
