import 'package:firebase_storage/firebase_storage.dart';

abstract class UploadImageUseCase {
  Future<UploadTask> call({required String imagePath});
}
