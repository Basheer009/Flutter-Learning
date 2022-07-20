import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

// class LocationService {
//   var location;
//
//   Future<Position> getLocation() async {
//     Position position;
//     if (location == null) {
//     }
//     position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low);
//     if (kDebugMode) {
//       print(position);
//     }
//     location =
//         position.latitude.toString() + "," + position.longitude.toString();
//     return position;
//   }
//
//   Future<bool> getLocationPermission() async {
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       if (kDebugMode) {
//         print('LocationPermission.denied');
//       }
//       permission = await Geolocator.requestPermission();
//       if (kDebugMode) {
//         print('Geolocator.requestPermission()');
//       }
//       if (permission == LocationPermission.deniedForever) {
//         return Future.error('Location Not Available');
//       }
//     } else {
//       print('LocationPermission.OK');
//       return true;
//     }
//     print('True.OK');
//     return true;
//   }
// }

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (kDebugMode) {
        print(position);
      }
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (kDebugMode) {
        print('LocationPermission.denied');
      }
      permission = await Geolocator.requestPermission();
      if (kDebugMode) {
        print('Geolocator.requestPermission()');
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      print('LocationPermission.OK');
      return true;
    }
    print('True.OK');
    return true;
  }
}

// Future<Position> getLocation() async {
//   Position position;
//   if (location == null) {
//   }
//   position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.low);
//   if (kDebugMode) {
//     print(position);
//   }
//   location =
//       position.latitude.toString() + "," + position.longitude.toString();
//   return position;
// }
