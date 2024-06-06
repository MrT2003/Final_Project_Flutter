import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/login/login_page.dart';
import 'package:final_project_flutter/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'images/welcome_page.png',
                width: 300,
                height: 300,
              ),
              Text(
                'Welcome to my app',
                style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.to(() => LoginPage()),
                      child: Text('Log in'.toUpperCase()),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColor.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => SignUpPage()),
                      child: Text('Sign Up'.toUpperCase()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.blue,
                        foregroundColor: AppColor.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
