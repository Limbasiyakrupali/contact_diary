// import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImgProvider extends ChangeNotifier {
//   ImagePicker imagePicker = ImagePicker();
//   XFile? xFile;
//   String? pickImagePath;
//
//   String? path;
//
//   void pickedImage() {
//     pickImagePath = path;
//     notifyListeners();
//   }
//
//   void reimg() {
//     pickImagePath = path;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageProvider extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;
  String? pickImagePath;
  Future<void> pickImage() async {
    xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      pickImagePath = xFile!.path;
      notifyListeners();
    }
  }
}
