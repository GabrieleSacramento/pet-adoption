import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/repositories/upload_image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImagePicker imagePicker;
  final FirebaseStorage storage;

  ImageRepositoryImpl({required this.imagePicker, required this.storage});

  @override
  Future<XFile> getImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    return image!;
  }

  @override
  Future<UploadTask> uploadImage(String imagePath) async {
    File file = File(imagePath);
    try {
      String ref = 'images/img-${DateTime.now().weekday}.jpg';
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
