import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/entities/pet_info_entity.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/get_pet_information_use_case.dart';

part 'get_pet_info_state.dart';

class GetPetInfoCubit extends Cubit<GetPetInfoState> {
  final GetPetInformationUseCase getPetInformationUseCase;
  GetPetInfoCubit({required this.getPetInformationUseCase})
      : super(GetPetInfoInitial());

  Future<List<PetInfoEntity>> fetchPetInformation() async {
    try {
      emit(GetPetInfoLoading());
      final List<PetInfoEntity> petInfoEntity =
          await getPetInformationUseCase.getPetInformation();
      emit(
        GetPetInfoSuccess(
          petInfoEntity: petInfoEntity,
        ),
      );
    } catch (e) {
      emit(GetPetInfoError(message: e.toString()));
    }
    return [];
  }
}
