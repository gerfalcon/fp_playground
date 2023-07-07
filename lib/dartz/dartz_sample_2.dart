// ignore_for_file: avoid_print
import 'dart:io';

void main() {
  print('Hello!');
}

class FakeHttpClient {
  Future<Map<String, dynamic>> getResponseBody() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => throw const HttpException('404'),
    );
  }
}

class PostService {
  final httpClient = FakeHttpClient();

  Future<Post> getOnePost() async {
    try {
      final responseBody = await httpClient.getResponseBody();
      return Post.fromJson(responseBody);
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
  }
}

class Post {
  Post.fromJson(Map<String, dynamic> json) {
    print(json);
  }

  Map<String, dynamic> toJson() => {};
}

class Failure {
  Failure(this.message);

  final String message;

  @override
  String toString() => message;
}
