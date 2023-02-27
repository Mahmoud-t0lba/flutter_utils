import 'package:device_info/device_info.dart';

class DeviceInfo {
  static Future<String> getAndroidDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ' + androidInfo.model);
    return androidInfo.model;
  }

  static Future<String> getIosDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on ' + iosInfo.utsname.machine);
    return iosInfo.model;
  }
}