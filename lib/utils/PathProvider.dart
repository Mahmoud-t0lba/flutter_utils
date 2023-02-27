import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PathProvider {

  static Future<String> getTemporaryDirectoryPath() async {
    Directory tempDir = await getTemporaryDirectory();
    return  tempDir.path;
  }

  static Future<String> getApplicationDocumentsDirectoryPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    return  appDocDir.path;
  }
}