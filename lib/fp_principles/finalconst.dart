/*class IPerson {
  final String name;
  final int age;

  IPerson(this.name, this.age);
}

void main() {
  var john = IPerson('John', 25);

  print(john.name); // Prints: John
  print(john.age); // Prints: 25

  //john.name = 'David';  // compile-time error
  //john.age = 30;       // compile-time error
}*/
final class IPerson {
  String name;
  int age;

  IPerson(this.name, this.age);

  IPerson copyWith({String? name, int? age}) {
    return IPerson(
      name ?? this.name,
      age ?? this.age,
    );
  }
}

void main() {
  final List<int> numbers = [1, 2, 3];
  //numbers = [4, 5, 6];  // This will cause a compile-time error
  numbers.add(4); // This is allowed
  print(numbers); // Output: [1, 2, 3, 4]

  const List<int> constNumbers = [1, 2, 3];
  //constNumbers = [4, 5, 6];  // This will cause a compile-time error
  //constNumbers.add(4);  // This will also cause a compile-time error
  print(constNumbers); // Output: [1, 2, 3]
}
