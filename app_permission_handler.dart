import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandler {
  static Future<bool> _requestPermission(Permission permission, String permissionName) async {
    final status = await permission.status;

    if (status.isGranted) {
      log('$permissionName permission granted');
      return true;
    } else if (status.isDenied || status.isRestricted) {
      log('$permissionName permission denied');
      final result = await permission.request();
      return result.isGranted;
    } else if (status.isPermanentlyDenied) {
      log('$permissionName permission permanently denied');
      await openAppSettings();
      return false;
    }
    return false;
  }

  static Future<bool> requestCameraPermission() => _requestPermission(Permission.camera, 'Camera');
  static Future<bool> requestNotificationPermission() => _requestPermission(Permission.notification, 'Notification');
  static Future<bool> requestStoragePermission() => _requestPermission(Permission.storage, 'Storage');
  static Future<bool> requestMicrophonePermission() => _requestPermission(Permission.microphone, 'Microphone');
  static Future<bool> requestContactsPermission() => _requestPermission(Permission.contacts, 'Contacts');
  static Future<bool> requestCalendarPermission() => _requestPermission(Permission.calendar, 'Calendar');
  static Future<bool> requestBluetoothPermission() => _requestPermission(Permission.bluetooth, 'Bluetooth');
  static Future<bool> requestBackgroundLocationPermission() =>
      _requestPermission(Permission.locationAlways, 'Background Location');
  static Future<bool> requestPhonePermission() => _requestPermission(Permission.phone, 'Phone');
  static Future<bool> requestSmsPermission() => _requestPermission(Permission.sms, 'SMS');

  static Future<bool> requestLocationPermission() async {
    LocationPermission geolocatorPermission = await Geolocator.checkPermission();
    if (geolocatorPermission == LocationPermission.denied) {
      geolocatorPermission = await Geolocator.requestPermission();
    }
    if (geolocatorPermission == LocationPermission.deniedForever) {
      geolocatorPermission = await Geolocator.requestPermission();
    }
    if (geolocatorPermission == LocationPermission.whileInUse || geolocatorPermission == LocationPermission.always) {
      return true;
    }

    return _requestPermission(Permission.location, 'Location');
  }
}
