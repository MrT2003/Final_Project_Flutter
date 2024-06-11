import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/login/widget/login_button.dart';
import 'package:final_project_flutter/pages/login/widget/login_header.dart';
import 'package:final_project_flutter/pages/login/widget/login_textfield.dart';
import 'package:final_project_flutter/pages/login/widget/sign_up_link.dart';
import 'package:final_project_flutter/pages/register/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Final Project Flutter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  final SignUpController sign = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              LoginHeader(),
              LoginTextfield(sign: sign, formKey: _formKey),
              SizedBox(
                height: 10,
              ),
              LoginButton(formKey: _formKey, sign: sign),
              SignUpLink(),
            ],
          ),
        ),
      ),
    );
  }
}
