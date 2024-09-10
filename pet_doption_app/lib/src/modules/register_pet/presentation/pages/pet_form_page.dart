import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/entities/pet_info_entity.dart';
import 'package:pet_doption_app/src/modules/register_pet/presentation/cubit/add_pet_info_cubit.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_button.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_form.dart';
import 'package:pet_doption_app/src/utils/widgets/loading_button.dart';

import '../../../../utils/widgets/custom_app_bar.dart';
import '../../../pet_description/presentation/pages/pet_description_page.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final _formKey = GlobalKey<FormState>();
  final petNameController = TextEditingController();
  final petAgeController = TextEditingController();
  final petRaceController = TextEditingController();
  final petWeigthController = TextEditingController();
  final petSexController = TextEditingController();
  final petDescriptionController = TextEditingController();
  final petLocalizationController = TextEditingController();
  final AddPetInfoCubit _addPetInfoCubit = GetIt.I.get<AddPetInfoCubit>();

  String? validateField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Este campo precisa ser preenchido';
    }

    return null;
  }

  @override
  void dispose() {
    super.dispose();
    petNameController.dispose();
    petAgeController.dispose();
    petRaceController.dispose();
    petWeigthController.dispose();
    petSexController.dispose();
    petDescriptionController.dispose();
    petLocalizationController.dispose();
  }

  void clearForm() {
    _formKey.currentState?.reset();
    petNameController.clear();
    petAgeController.clear();
    petRaceController.clear();
    petWeigthController.clear();
    petSexController.clear();
    petDescriptionController.clear();
    petLocalizationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => _addPetInfoCubit,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              appBarTitle: 'Cadastre um pet',
              isBackButtonVisible: true,
              onBackButtonPressed: () => Navigator.pop(context),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 32.w, top: 24.h),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Text(
                          'Aqui só serão necessárias informações a respeito do pet que será doado.',
                          style: TextStyle(
                            fontSize: 14.h,
                            color: const Color.fromRGBO(86, 83, 83, 1),
                          ),
                        ),
                      ),
                      CustomForm(
                        controller: petNameController,
                        hintText: 'Nome',
                        label: 'Nome',
                        validator: validateField,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                        child: CustomForm(
                          controller: petAgeController,
                          hintText: 'Idade',
                          label: 'Idade',
                          validator: validateField,
                        ),
                      ),
                      CustomForm(
                        controller: petRaceController,
                        hintText: 'Raça',
                        label: 'Raça',
                        validator: validateField,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                        child: CustomForm(
                          controller: petWeigthController,
                          hintText: 'Peso',
                          label: 'Peso',
                          validator: validateField,
                        ),
                      ),
                      CustomForm(
                        controller: petSexController,
                        hintText: 'Sexo',
                        label: 'Sexo',
                        validator: validateField,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: CustomForm(
                          controller: petLocalizationController,
                          hintText: 'Localização',
                          label: 'Localização',
                          validator: validateField,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                        child: CustomForm(
                          controller: petDescriptionController,
                          hintText: 'Descrição do pet',
                          label: 'Descrição do pet',
                          validator: validateField,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Container(
                          width: double.maxFinite,
                          height: 48.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: const Color.fromRGBO(37, 41, 84, 0.15),
                              width: 1.w,
                            ),
                          ),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.file_download_outlined,
                              color: Color.fromRGBO(241, 152, 69, 1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: 32.h,
                        ),
                        child: BlocConsumer<AddPetInfoCubit, AddPetInfoState>(
                          listener: (context, state) {
                            if (state is AddPetInfoSuccess) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PetDescriptionPage(
                                      petImageUrl: 'assets/images/kiki.jpeg',
                                      petSex: petSexController.text,
                                      petName: petNameController.text,
                                      petLocalization:
                                          petLocalizationController.text,
                                      petAge: petAgeController.text,
                                      petRace: petRaceController.text,
                                      petWeight: petWeigthController.text,
                                      petDescription:
                                          petDescriptionController.text,
                                    );
                                  },
                                ),
                              );
                            }
                            if (state is AddPetInfoError) {
                              showActionSnackBar(context);
                            }
                          },
                          builder: (context, state) {
                            if (state is AddPetInfoLoading) {
                              return const LoadingButton(
                                isLarge: true,
                              );
                            }
                            return CustomButton(
                              textButton: 'Cadastrar pet',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _addPetInfoCubit.addPetInformation(
                                    PetInfoEntity(
                                      name: petNameController.text,
                                      race: petRaceController.text,
                                      age: petAgeController.text,
                                      description:
                                          petDescriptionController.text,
                                      imageUrl: 'teste.png',
                                      sex: petSexController.text,
                                      weight: petWeigthController.text,
                                      localization:
                                          petLocalizationController.text,
                                    ),
                                  );
                                }
                              },
                              textButtonSize: 14.h,
                              isLarge: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showActionSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text(
        'Não foi possivel cadastrar o pet, verifique os campos e tente novamente',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
