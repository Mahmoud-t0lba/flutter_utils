import 'dart:io';

import 'package:device_info/device_info.dart';

Future<String?> getDeviceBrand() async {
  if (Platform.isAndroid) {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    return androidDeviceInfo.brand;
  } else {
    return null;
  }
}
