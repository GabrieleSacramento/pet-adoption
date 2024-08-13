import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_button.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_form.dart';

import '../../../../utils/widgets/custom_app_bar.dart';
import '../../../pet_description/presentation/pages/pet_description_page.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final petNameController = TextEditingController();

  final petAgeController = TextEditingController();
  final petRaceController = TextEditingController();
  final petWeigthController = TextEditingController();
  final petSexController = TextEditingController();
  final petDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarTitle: 'Cadastre um pet',
          isBackButtonVisible: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 32.w, top: 24.h),
          child: SingleChildScrollView(
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                  child: CustomForm(
                    controller: petAgeController,
                    hintText: 'Idade',
                    label: 'Idade',
                  ),
                ),
                CustomForm(
                  controller: petRaceController,
                  hintText: 'Raça',
                  label: 'Raça',
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                  child: CustomForm(
                    controller: petWeigthController,
                    hintText: 'Peso',
                    label: 'Peso',
                  ),
                ),
                CustomForm(
                  controller: petSexController,
                  hintText: 'Sexo',
                  label: 'Sexo',
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                  child: CustomForm(
                    controller: petDescriptionController,
                    hintText: 'Descrição do pet',
                    label: 'Descrição do pet',
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
                  child: CustomButton(
                    textButton: 'Cadastrar pet',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PetDescriptionPage();
                          },
                        ),
                      );
                    },
                    textButtonSize: 14.h,
                    isLarge: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
