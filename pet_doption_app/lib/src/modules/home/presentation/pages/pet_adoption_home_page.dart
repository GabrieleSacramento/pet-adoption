import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_doption_app/src/modules/pet_description/presentation/pages/pet_description_page.dart';
import 'package:pet_doption_app/src/modules/register_pet/presentation/pages/pet_form.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_button.dart';

class PetAdoptionHomePage extends StatelessWidget {
  const PetAdoptionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const HomePageAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const RegisterThePetToDonateWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 16.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Encontre um amigo',
                      style: TextStyle(
                        fontSize: 20.h,
                        color: const Color.fromRGBO(86, 83, 83, 1),
                      ),
                    ),
                  ),
                ),
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.w,
                    crossAxisSpacing: 16.h,
                  ),
                  itemBuilder: (context, index) {
                    return const ChooseAPetToAdoptWidget();
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                  ),
                  child: CustomButton(
                    textButton: 'Ver mais',
                    onPressed: () {},
                    textButtonSize: 16.h,
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

class ChooseAPetToAdoptWidget extends StatelessWidget {
  const ChooseAPetToAdoptWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PetDescriptionPage()));
      },
      child: Container(
        height: 191.h,
        width: 171.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 130.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                color: const Color.fromRGBO(241, 152, 69, 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h, top: 8.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          'Paçoca',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(86, 83, 83, 1),
                          ),
                        ),
                        Text(
                          ' (Macho)',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(86, 77, 77, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: const Color.fromRGBO(241, 152, 69, 1),
                        size: 16.sp,
                      ),
                      Text(
                        'Salvador, ba',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(86, 77, 77, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterThePetToDonateWidget extends StatelessWidget {
  const RegisterThePetToDonateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 112.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/pets.png'),
              alignment: Alignment.centerRight,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Deseja doar um pet?',
                      style: TextStyle(
                        fontSize: 20.h,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomButton(
                      textButton: 'Clique aqui',
                      isLarge: false,
                      buttonColor: const Color.fromRGBO(255, 255, 255, 1),
                      textButtonColor: const Color.fromRGBO(241, 152, 69, 1),
                      textButtonSize: 16.h,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PetForm(),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 80.h,
      title: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Amigo peludo',
              style: TextStyle(
                fontSize: 20.h,
                color: const Color.fromRGBO(241, 152, 69, 1),
              ),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/mari.JPG'),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
