// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';

final ingredientsByDish = imap({
  'caprese salad': ilist(['tomato', 'mozzarella', 'basil', 'oil']),
  'pasta bolognese':
      ilist(['pasta', 'tomato', 'minced meat', 'onion', 'garlic', 'oil']),
  'oreos': ilist(['oreos']),
  'snacks': ilist(['snacks']),
});

final menuForTwo = ilist(['caprese salad', 'pasta bolognese']);
final menuForOne = ilist(["mac'n' cheese", 'oreos']);

Option<IMap<String, int>> buildShoppingList(
    IList<String> menu, int numberOfPeople) {
  final Option<IList<String>> maybeIngredients =
      menu.traverseOptionM(ingredientsByDish.get);

  return maybeIngredients.map((ingredients) => ingredients.foldMap(
      imapMonoid(IntSumMi),
      (ingredient) => singletonMap(ingredient, numberOfPeople)));
}

void main() {
  print('Hello!');
  print(buildShoppingList(menuForOne, 1));
}
