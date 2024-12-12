import 'package:firebase_storage/firebase_storage.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/repositories/upload_image_repository.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/upload_image_use_case.dart';

class UploadImageUseCaseImpl implements UploadImageUseCase {
  final ImageRepository repository;

  UploadImageUseCaseImpl({required this.repository});

  @override
  Future<UploadTask> call({required String imagePath}) {
    return repository.uploadImage(imagePath);
  }
}
