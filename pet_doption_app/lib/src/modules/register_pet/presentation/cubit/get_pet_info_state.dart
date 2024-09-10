part of 'get_pet_info_cubit.dart';

@immutable
sealed class GetPetInfoState {}

final class GetPetInfoInitial extends GetPetInfoState {}

final class GetPetInfoLoading extends GetPetInfoState {}

final class GetPetInfoSuccess extends GetPetInfoState {
  final List<PetInfoEntity> petInfoEntity;

  GetPetInfoSuccess({required this.petInfoEntity});
}

final class GetPetInfoError extends GetPetInfoState {
  final String message;

  GetPetInfoError({required this.message});
}
