import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:pet_doption_app/src/modules/register_pet/infra/datasources/upload_image_datasource.dart';

class UploadImageDatasourceImpl implements UploadImageDatasource {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Future<UploadTask> uploadImage(String path) async {
    File file = File(path);

    try {
      String ref = 'images/img_${DateTime.now()}.png';

      return firebaseStorage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
