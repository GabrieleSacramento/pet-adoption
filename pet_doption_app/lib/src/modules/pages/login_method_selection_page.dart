import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginMethodSelectionPage extends StatelessWidget {
  const LoginMethodSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/animations/login_animation.json'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Encontre seu novo amigo aqui',
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
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(241, 152, 69, 1),
                        minimumSize: const Size(175, 43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Google',
                        style: TextStyle(
                          fontSize: 16.h,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
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
