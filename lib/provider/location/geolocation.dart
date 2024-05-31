// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class GetLocation with ChangeNotifier {
//   double _latitude = 0.0;
//   double _longitude = 0.0;
//   double get getLatitude => _latitude;
//   double get getLongitude => _longitude;
//   List<Placemark> _placemark = [];
//   List<Placemark> get placemark => _placemark;
//   String _address = '';
//   String get address => _address;

//   Future<(double, double, String)> getGeolocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       await Geolocator.requestPermission();
//     } else {
//       Position currentPosition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       _latitude = currentPosition.latitude;
//       _longitude = currentPosition.longitude;
//       _placemark = await placemarkFromCoordinates(_latitude, _longitude,);
//       _address =
//           "${_placemark[0].locality} ,${_placemark[0].subLocality} ,${_placemark[0].street} ,${_placemark[0].thoroughfare},House Number ${_placemark[0].subThoroughfare}";

//       notifyListeners();
//     }
//     return (
//       _latitude,
//       _longitude,
//       "${_placemark[0].locality} ,${_placemark[0].subLocality} ,${_placemark[0].street} ,${_placemark[0].thoroughfare},House Number ${_placemark[0].subThoroughfare}"
//     );
//   }

//   getloca() async {
//     return await getGeolocation();
//   }
// }
