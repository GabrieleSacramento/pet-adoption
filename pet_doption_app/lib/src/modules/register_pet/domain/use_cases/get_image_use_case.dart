import 'package:image_picker/image_picker.dart';

abstract class GetImageUseCase {
  Future<XFile> call();
}
