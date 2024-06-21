import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/signup/sign_up_controller.dart';
import 'package:flutter/material.dart';

class SignUpTextfield extends StatelessWidget {
  final SignUpController sign;
  final GlobalKey<FormState> formKey;

  const SignUpTextfield({super.key, required this.formKey, required this.sign});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
            controller: sign.fullName,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Full Name',
              hintStyle: TextStyle(color: AppColor.blue, fontSize: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                Icons.person,
                color: AppColor.blue,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
            controller: sign.phoneNo,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Phone No',
              hintStyle: TextStyle(color: AppColor.blue, fontSize: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                Icons.phone,
                color: AppColor.blue,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
            controller: sign.email,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Email',
              hintStyle: TextStyle(color: AppColor.blue, fontSize: 18),
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
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
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
              hintStyle: TextStyle(color: AppColor.blue, fontSize: 18),
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
      ]),
    );
  }
}
