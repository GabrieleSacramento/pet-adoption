import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageRepository {
  Future<XFile> getImage();
  Future<UploadTask> uploadImage(String imagePath);
}
