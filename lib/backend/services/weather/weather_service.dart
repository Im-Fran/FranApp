import 'dart:convert';

import 'package:fran_app/backend/logger.dart';
import 'package:fran_app/backend/models/weather.dart';
import 'package:fran_app/backend/utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;


class WeatherService {

  bool isDayLight() {
    final now = DateTime.now();
    return now.hour >= 6 && now.hour <= 18;
  }

  Future<int?> fetchLocationId(String terms) async {
    // Turn terms into url friendly string
    terms = terms.replaceAll(' ', '+');

    // Search for available locations
    final response = await http.get(Uri.parse('https://api-meteored.franciscosolis.cl/locations?query=$terms'));
    if(response.statusCode != 200) {
      logger.e("Error searching place: ${response.statusCode}");
      return null;
    }

    // Select first location
    final location = (jsonDecode(response.body)['localidad'] as List<dynamic>).firstOrNull;
    if(location == null) {
      logger.e("Error searching place: No location found");
      return null;
    }

    return location['id'] as int;
  }

  Future<Iterable<WeatherForecast>?> fetchLocalForecast() async {
    try {
      // Check for location permission
      final placemark = await getLocation();
      if(placemark == null) {
        return null;
      }

      final place = "${placemark.street},${placemark.postalCode}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}.";
      final locationId = await fetchLocationId(place);
      if(locationId == null) {
        return null;
      }

      return fetchForecast(locationId);
    } catch (_) {
      return null;
    }
  }

  Future<Iterable<WeatherForecast>?> fetchForecast(int locationId) async {
    try {
      final response = await http.get(Uri.parse('https://api-meteored.franciscosolis.cl/weather?location_id=$locationId'));
      if(response.statusCode != 200) {
        logger.e("Error fetching weather: ${response.statusCode}");
        return null;
      }

      final days = jsonDecode(response.body)['day'] as dynamic;
      return List.generate(5, (index) {
        final forecastData = days['$index'];
        if (forecastData == null) {
          return null;
        }

        return WeatherForecast.fromJson(forecastData);
      }).nonNulls;
    } catch (_) {
      return null;
    }
  }

  Future<Placemark?> getLocation() async {
    try {
      // Check for location permission
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

      return (await placemarkFromCoordinates(position.latitude, position.longitude)).firstOrNull;
    } catch (_) {}

    return null;
  }
}