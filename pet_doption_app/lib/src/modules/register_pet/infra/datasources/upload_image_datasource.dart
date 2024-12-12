import 'package:firebase_storage/firebase_storage.dart';

abstract class UploadImageDatasource {
  Future<UploadTask> uploadImage(String path);
}
