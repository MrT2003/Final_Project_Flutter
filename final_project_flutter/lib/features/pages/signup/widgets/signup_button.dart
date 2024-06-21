import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/signup/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final SignUpController sign;
  const SignUpButton({super.key, required this.formKey, required this.sign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
        onPressed: () {
          Get.focusScope?.unfocus();
          if (formKey.currentState!.validate()) {
            SignUpController.instance.registerUser(
                sign.email.text.trim(), sign.password.text.trim());
          }
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColor.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 60),
        ),
        child: const Text('Sign up'),
      ),
    );
  }
}
