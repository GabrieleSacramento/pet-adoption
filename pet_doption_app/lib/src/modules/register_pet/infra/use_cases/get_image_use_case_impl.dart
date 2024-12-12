import 'package:image_picker/image_picker.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/repositories/upload_image_repository.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/get_image_use_case.dart';

class GetImageUseCaseImpl implements GetImageUseCase {
  final ImageRepository repository;

  GetImageUseCaseImpl({required this.repository});

  @override
  Future<XFile> call() {
    return repository.getImage();
  }
}
