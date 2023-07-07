// ignore_for_file: avoid_print

extension ExtensionList<T> on List<T> {
  // get the last item of the list
  T get lastItem => this[length - 1];

  // get a reversed copy of the list
  List<T> get reversedCopy => this.reversed.toList();

  // repeat the list n times
  List<T> repeat(int times) => [for (int i = 0; i < times; i++) ...this];
}

void main() {
  var list = [1, 2, 3, 4, 5];

  print(list.lastItem); // 5
  final asd = list.first;
  print(list.reversedCopy); // [5, 4, 3, 2, 1]
  print(list.repeat(3)); // [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
}
