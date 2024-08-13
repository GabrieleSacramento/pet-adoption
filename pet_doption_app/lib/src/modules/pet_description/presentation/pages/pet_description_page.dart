import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_doption_app/src/modules/chat/presentation/pages/pet_adoption_chat_page.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_button.dart';

import '../../../../utils/widgets/custom_app_bar.dart';

class PetDescriptionPage extends StatelessWidget {
  const PetDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarTitle: 'Sobre o pet',
          isBackButtonVisible: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: Image.asset('assets/images/picture.jpg').image,
                  //     fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Paçoca',
                        style: TextStyle(
                          fontSize: 32.h,
                          color: const Color.fromRGBO(241, 152, 69, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 32.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: const Color.fromRGBO(241, 152, 69, 1),
                            size: 20.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Salvador, ba',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(86, 77, 77, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 76.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                            border: Border.all(
                              color: const Color.fromRGBO(241, 152, 69, 1),
                              width: 2.w,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sexo',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(166, 160, 160, 1),
                                ),
                              ),
                              Text(
                                'Macho',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(86, 83, 83, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Descrição',
                          style: TextStyle(
                            fontSize: 20.h,
                            color: const Color.fromRGBO(241, 152, 69, 1),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Paçoca é um famoso vira lata caramelo, muito fofo e brincalhão.Ele tem 6 meses e já foi castrado, agora está em busca de um novo lar. Que tal tê-lo como seu novo amigo? ',
                        style: TextStyle(
                          fontSize: 14.h,
                          color: const Color.fromRGBO(86, 83, 83, 1),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 16.h, bottom: 16.h, left: 56.h, right: 56.h),
                        child: CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PetAdoptionChatPage(),
                              ),
                            );
                          },
                          textButton: 'Adote um amigo',
                          isLarge: true,
                          isTOShowIcon: true,
                          iconButton: Icons.pets_outlined,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
