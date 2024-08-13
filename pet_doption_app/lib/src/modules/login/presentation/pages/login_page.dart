import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_app_bar.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_button.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_form.dart';
import 'package:string_validator/string_validator.dart' as validator;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarTitle: 'Login',
          isBackButtonVisible: true,
          backgroundColor: Colors.white,
          appBarTitleColor: Color.fromRGBO(241, 152, 69, 1),
          appBarIconColor: Color.fromRGBO(241, 152, 69, 1),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 32.w,
              top: 24.h,
              bottom: 32.h,
            ),
            child: Column(
              children: [
                Lottie.asset('assets/animations/login_animation.json'),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomForm(
                        controller: emailController,
                        obscurePassword: false,
                        hintText: 'Email',
                        label: 'Email',
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Este campo é obrigatório';
                          }
                          if (!validator.isEmail(text)) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                        child: CustomForm(
                          controller: passwordController,
                          obscurePassword: false,
                          hintText: 'Senha',
                          label: 'Senha',
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Este campo precisa ser preenchido';
                            }
                            if (!validator.isEmail(text)) {
                              return 'Senha inválida';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  textButton: 'Entrar',
                  onPressed: () {},
                  isLarge: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
