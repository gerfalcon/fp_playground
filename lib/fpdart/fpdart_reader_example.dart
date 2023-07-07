import 'package:fpdart/fpdart.dart';

class Config {
  final String url;
  final int port;

  Config({required this.url, required this.port});
}

// Readers for different services
Reader<Config, String> doSomethingWithConfigReader() {
  return Reader(
      (Config config) => 'Doing something with ${config.url}:${config.port}');
}

Reader<Config, String> doAnotherThingWithConfigReader() {
  return Reader((Config config) =>
      'Doing another thing with ${config.url}:${config.port}');
}

Reader<Config, String> doYetAnotherThingWithConfigReader() {
  return Reader((Config config) =>
      'Doing yet another thing with ${config.url}:${config.port}');
}

void main() {
  final config = Config(url: 'localhost', port: 8000);

  // Combining the services using `Reader`'s `map2` and `map3` methods
  final combinedService = doSomethingWithConfigReader()
      .map2(doAnotherThingWithConfigReader(), (a, b) => '$a\n$b')
      .flatMap((result) =>
          doYetAnotherThingWithConfigReader().map((c) => '$result\n$c'));

  print(combinedService.run(config)); // Runs the combined services
}
