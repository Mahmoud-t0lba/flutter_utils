// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  static Future<PickedFile?> imageFromGallery() async {
    var imageFile = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    return imageFile;
  }

  static Future<PickedFile?> imageFromCamera() async {
    var imageFile = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    return imageFile;
  }

  static Future<PickedFile?> videoFromGallery() async {
    var videoFile =
        await ImagePicker.platform.pickVideo(source: ImageSource.gallery);
    return videoFile;
  }

  static Future<PickedFile?> videoFromCamera() async {
    var videoFile =
        await ImagePicker.platform.pickVideo(source: ImageSource.camera);
    return videoFile;
  }
}
