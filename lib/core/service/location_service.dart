import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getUserPosition({
    bool canRetrieveCachedPosition = true,
  }) async {
    Position? userPosition;
    try {
      userPosition = await _fetchUserPosition();
    } catch (e) {
      if (e is TimeoutException || e is LocationServiceDisabledException) {
        userPosition = null;
      }
    }
    return userPosition;
  }

  Future<Position?> _fetchUserPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }
}
