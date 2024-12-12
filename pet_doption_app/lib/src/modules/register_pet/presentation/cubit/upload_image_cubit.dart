import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/get_image_use_case.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/upload_image_use_case.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final GetImageUseCase getImageUseCase;
  final UploadImageUseCase uploadImageUseCase;

  UploadImageCubit(
      {required this.getImageUseCase, required this.uploadImageUseCase})
      : super(UploadImageInitial());

  pickAndUploadImage() async {
    final XFile image = await getImageUseCase();
    final UploadTask task = await uploadImageUseCase(imagePath: image.path);
    task.snapshotEvents.listen((event) {
      if (event.state == TaskState.running) {
        emit(UploadImageLoading());
      } else if (event.state == TaskState.success) {
        final String imageUrl = event.ref.fullPath;
        emit(
          ImageUploaded(imageUrl: imageUrl),
        );
      }
    });
  }
}
