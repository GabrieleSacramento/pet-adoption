part of 'upload_image_cubit.dart';

sealed class UploadImageState extends Equatable {
  const UploadImageState();

  @override
  List<Object> get props => [];
}

final class UploadImageInitial extends UploadImageState {}

final class ImageUploaded extends UploadImageState {
  final String imageUrl;
  const ImageUploaded({required this.imageUrl});
  @override
  List<Object> get props => [imageUrl];
}

final class UploadImageLoading extends UploadImageState {}

final class UploadImageError extends UploadImageState {}
