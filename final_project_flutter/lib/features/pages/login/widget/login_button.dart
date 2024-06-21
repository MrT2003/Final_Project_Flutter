import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/home_page/widgets/bottom_navigation_bar.dart';
import 'package:final_project_flutter/features/pages/signup/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final SignUpController sign;

  const LoginButton({super.key, required this.formKey, required this.sign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              var result = await sign.loginUser(
                  sign.email.text.trim(), sign.password.text.trim());
              if (result == 'success') {
                Get.off(() => BottomNavigationBar_2());
              } else {
                Get.snackbar(
                  'Login Failed',
                  result,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.redAccent,
                  colorText: Colors.white,
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColor.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 60),
          ),
          child: Text('Sign in')),
    );
  }
}
