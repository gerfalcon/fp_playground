// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> {
  const Result();
}

/// The [Success] and [Failure] classes above use the final class modifier to prevent further subclassing.
/// To learn more, read: [Class modifiers](https://dart.dev/language/class-modifiers).
final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);

  final E exception;
}

sealed class Shape {}

class Square implements Shape {
  final double length;

  Square(this.length);
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
      Square(length: var l) => l * l,
      Circle(radius: var r) => 3.14 * r * r
    };

void main() async {
  final Result<Post, Exception> result = await getPost();

  /// Unwrapping a Result value without pattern matching
  if (result is Success<Post, Exception>) {
    print(result.value);
  } else if (result is Failure<Post, Exception>) {
    print(result.exception);
  }

  /// Unwrapping a Result value with pattern matching
  final String value = switch (result) {
    Success(value: final post) => post.toString(),
    // We have to clearly deal with errors. If we don't and we comment the upcoming Failure branch,, the compiler will give us an error.
    Failure(exception: final exception) => exception.toString(),
  };
  print(value);
}

Future<Result<Post, Exception>> getPost() async {
  try {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(uri);
    switch (response.statusCode) {
      case 200:
        final dynamic postJson = json.decode(response.body);
        // Return Success with the mapped post
        return Success(Post.fromMap(postJson));
      default:
        // Return Failure with the exception
        throw Failure(Exception(response.reasonPhrase));
    }
  } on Exception catch (exception) {
    print('Error while getting post');
    return Failure(Exception(exception.toString()));
  } on TypeError catch (error) {
    print('Type error while getting post');
    return Failure(Exception(error.toString()));
  } catch (error) {
    print('Unexpected error while getting post');
    return Failure(Exception(error.toString()));
  }
}

class Post {
  late final int id;
  late final bool title;

  Post.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }

  @override
  String toString() {
    return 'Post(id: $id, title: $title)';
  }
}
