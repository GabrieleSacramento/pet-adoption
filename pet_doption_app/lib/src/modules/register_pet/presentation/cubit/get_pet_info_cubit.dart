import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/entities/pet_info_entity.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/get_pet_information_use_case.dart';

part 'get_pet_info_state.dart';

class GetPetInfoCubit extends Cubit<GetPetInfoState> {
  final GetPetInformationUseCase getPetInformationUseCase;

  GetPetInfoCubit({required this.getPetInformationUseCase})
      : super(GetPetInfoInitial());

  Future<void> getPets({bool isLoadMore = false}) async {
    try {
      emit(GetPetInfoLoading());
      final pets = await getPetInformationUseCase.getPets();
      emit(GetPetInfoSuccess(petInfoEntity: pets));
    } catch (e) {
      emit(const GetPetInfoError(
          message: "Não foi possível carregar as informações dos pets."));
    }
  }
}
