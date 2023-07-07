// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  try {
    final result = await getPost();

    print(result);
  } on Exception catch (_) {
    print('Error while getting location from IP address');
  }
}

/// getPost returns the post with id 1.
/// Throws an [Exception] if there is an exception while getting the post.
/// Throws a [TypeError] if there is a type mismatch in the mapping.
/// Throws any other error if there is an unexpected error.
Future<Post> getPost() async {
  try {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(uri);
    switch (response.statusCode) {
      case 200:
        final dynamic postJson = json.decode(response.body);
        return Post.fromMap(postJson);
      default:
        throw Exception(response.reasonPhrase);
    }
  } on Exception catch (_) {
    print('Error while getting post');
    rethrow;
  } on TypeError catch (_) {
    print('Type error while getting post');
    rethrow;
  } catch (_) {
    print('Unexpected error while getting post');
    rethrow;
  }
}

class Post {
  late final int id;
  late final String title;

  Post.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }

  @override
  String toString() {
    return 'Post(id: $id, title: $title)';
  }
}
