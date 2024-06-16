import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/register/sign_up_controller.dart';
import 'package:final_project_flutter/features/pages/register/widgets/login_link.dart';
import 'package:final_project_flutter/features/pages/register/widgets/signup_button.dart';
import 'package:final_project_flutter/features/pages/register/widgets/signup_header.dart';
import 'package:final_project_flutter/features/pages/register/widgets/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Final Project Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final SignUpController sign = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SignUpHeader(),
              const SizedBox(height: 30),
              SignUpTextfield(formKey: _formKey, sign: sign),
              const SizedBox(height: 10),
              SignUpButton(formKey: _formKey, sign: sign),
              // const SizedBox(height: 10),
              LoginLink(),
            ],
          ),
        ),
      ),
    );
  }
}
