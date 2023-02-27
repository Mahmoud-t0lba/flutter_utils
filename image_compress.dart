import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressorUtils {
  static Future<File?> testCompressAndGetFile(
      File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        quality: 50);
    await result?.length().then((length) {});

    return result;
  }

  static Future<Uint8List?> testCompressAsset(String assetName) async {
    var list = await FlutterImageCompress.compressAssetImage(
      assetName,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
    );

    return list;
  }

  static Future<List<int>> testCompressList(List<Uint8List> list) async {
    var result = await FlutterImageCompress.compressWithList(
      list as Uint8List,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
    );
    print(list.length);
    print(result.length);
    return result;
  }
}
