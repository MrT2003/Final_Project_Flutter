import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/authetication/authentication_repository.dart';
import 'package:final_project_flutter/pages/home_page/widgets/bottom_navigation_bar.dart';
import 'package:final_project_flutter/pages/register/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final SignUpController sign = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 90.0),
              child: Center(
                child: Icon(
                  Icons.shopping_cart_rounded,
                  size: 100,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              'HELLO AGAIN!',
              style: TextStyle(
                color: AppColor.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome back, you\'ve been missed',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: sign.email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(color: AppColor.blue, fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColor.blue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: sign.password,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.white,
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: AppColor.blue, fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColor.blue,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: AppColor.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: Text('Sign in')),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Register now',
                  style: TextStyle(
                    color: AppColor.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
