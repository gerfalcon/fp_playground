// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  try {
    final result = await getLocationFromIP('122.1.4.1222222');

    print(result.lat);
  } on Exception catch (_) {
    print('Error while getting location from IP address');
  } catch (e) {
    print('Unexpected error while getting location from IP address');
  }
}

/// getLocationFromIP returns the location of the given IP address.
/// Throws an [Exception] if there is an exception while getting the location.
/// Throws a [TypeError] if there is a crucial issue in the mapping.
/// Throws any other error if there is an unexpected error.
Future<Location> getLocationFromIP(String ipAddress) async {
  try {
    final uri = Uri.parse('http://ip-api.com/json/$ipAddress');
    final response = await http.get(uri);
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        return Location.fromMap(data);
      default:
        throw Exception(response.reasonPhrase);
    }
  } on Exception catch (_) {
    // make it explicit that this function can throw exceptions
    print('Error while getting location: $ipAddress');
    rethrow;
  } on TypeError catch (_) {
    // make it explicit that this function can throw exceptions
    print('Type error while getting location: $ipAddress');
    rethrow;
  } catch (_) {
    // make it explicit that this function can throw exceptions
    print('Unexpected error while getting location: $ipAddress');
    rethrow;
  }
}

class Location {
  late final double lat;
  late final double lon;

  Location.fromMap(Map<String, dynamic> map) {
    lat = map['lat'];
    lon = map['lon'];
  }
}
