import 'package:final_project_flutter/features/pages/login/login_page.dart';
import 'package:final_project_flutter/features/pages/register/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.to(() => LoginPage()),
                      child: Text('Log in'.toUpperCase()),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => SignUpPage()),
                      child: Text('Sign Up'.toUpperCase()),
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
