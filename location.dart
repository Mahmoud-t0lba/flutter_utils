import 'package:location/location.dart';

class LocationService {
  UserLocation? currentLocation;
  var location = Location();
  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      currentLocation = UserLocation(
        latitude: userLocation.latitude!,
        longitude: userLocation.longitude!,
      );
    } on Exception catch (e) {
      print('Could not get location\n$e');
    }
    return currentLocation!;
  }
}

class UserLocation {
  final double latitude;
  final double longitude;
  UserLocation({required this.latitude, required this.longitude});

  @override
  String toString() {
    return 'UserLocation{latitude: $latitude, longitude: $longitude}';
  }
}
