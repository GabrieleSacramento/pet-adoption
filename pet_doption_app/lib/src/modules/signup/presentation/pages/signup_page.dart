import 'package:brasil_fields/brasil_fields.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_app_bar.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_button.dart';
import 'package:pet_doption_app/src/utils/widgets/custom_form.dart';

import 'package:string_validator/string_validator.dart' as validator;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

bool isPasswordVisible = false;
final _formKey = GlobalKey<FormState>();
final nameController = TextEditingController();

final lastNameController = TextEditingController();

final emailController = TextEditingController();

final passwordController = TextEditingController();

final phoneController = TextEditingController();

String phoneNumber = '';

void onCountryChange(CountryCode countryCode) {
  phoneNumber = countryCode.toString();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    String phoneNumberWithCountryCode = phoneNumber + phoneController.text;
    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitle: 'Criar conta',
        isBackButtonVisible: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 32.w,
              top: 24.h,
              bottom: 32.h,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 23, 15, 15),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 148,
                  height: 148,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/picture.jpg'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 19),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Editar foto',
                      style: TextStyle(
                        color: Color.fromRGBO(103, 103, 103, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                CustomForm(
                  obscurePassword: false,
                  hintText: 'Nome',
                  controller: nameController,
                  label: 'Nome',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Este campo precisa ser preenchido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 9,
                ),
                CustomForm(
                  obscurePassword: false,
                  hintText: 'Sobrenome',
                  controller: lastNameController,
                  label: 'Sobrenome',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Este campo precisa ser preenchido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 9,
                ),
                CustomForm(
                  obscurePassword: false,
                  hintText: 'Email',
                  controller: emailController,
                  label: 'Email',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Este campo precisa ser preenchido';
                    }
                    if (!validator.isEmail(text)) {
                      return 'strings.incorrectEmail';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 9,
                ),
                CustomForm(
                  obscurePassword: isPasswordVisible,
                  hintText: 'Senha',
                  controller: passwordController,
                  label: 'Senha',
                  suffixIcon: GestureDetector(
                    onTap: () =>
                        setState(() => isPasswordVisible = !isPasswordVisible),
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Este campo precisa ser preenchido';
                    }
                    if (text.length < 8) {
                      return 'A senha deve conter no mínimo 8 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        'Telefone',
                        style: TextStyle(
                          color: const Color.fromRGBO(241, 152, 69, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.h,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        ' *',
                        style: TextStyle(
                          color: const Color.fromRGBO(241, 152, 69, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.h,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Container(
                      height: 47,
                      width: 83,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color.fromRGBO(37, 41, 84, 0.15),
                        ),
                      ),
                      child: const CountryCodePicker(
                        onChanged: onCountryChange,
                        padding: EdgeInsets.zero,
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(87, 87, 87, 1),
                        ),
                        initialSelection: 'BR',
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'strings.thisCampNeedsToBeFilled';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'strings.phone',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15.h),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(10, 101, 233, 1),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.redAccent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(37, 41, 84, 0.15),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  textButton: 'Criar conta',
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
