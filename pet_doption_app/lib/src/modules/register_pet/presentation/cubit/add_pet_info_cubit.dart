import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/entities/pet_info_entity.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/add_pet_information_use_case.dart';

part 'add_pet_info_state.dart';

class AddPetInfoCubit extends Cubit<AddPetInfoState> {
  final AddPetInformationUseCase addPetInformationUseCase;
  AddPetInfoCubit({required this.addPetInformationUseCase})
      : super(AddPetInfoInitial());

  void addPetInformation(PetInfoEntity petInfoEntity) async {
    try {
      emit(AddPetInfoLoading());
      await addPetInformationUseCase.addPetInformation(petInfoEntity);
      emit(AddPetInfoSuccess());
    } catch (e) {
      emit(AddPetInfoError(message: e.toString()));
    }
  }
}
