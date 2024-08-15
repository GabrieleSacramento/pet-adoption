import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_doption_app/src/modules/Auth/presentation/pages/login_page.dart';
import 'package:pet_doption_app/src/modules/Auth/presentation/pages/signup_page.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_button.dart';

class LoginMethodSelectionPage extends StatelessWidget {
  const LoginMethodSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                  'assets/animations/choose_login_method_animation.json'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Encontre seu novo amigo aqui',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(241, 152, 69, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 62, vertical: 24),
                      child: Text(
                        'Torne a sua vida mais feliz com um novo melhor amigo pet.',
                        style: TextStyle(
                          fontSize: 14.h,
                          color: const Color.fromRGBO(86, 83, 83, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CustomButton(
                      textButton: 'Entrar',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      textButtonSize: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                      child: Text(
                        'ou',
                        style: TextStyle(
                          fontSize: 14.h,
                          color: const Color.fromRGBO(241, 152, 69, 1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: 14.h,
                          color: const Color.fromRGBO(241, 152, 69, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
