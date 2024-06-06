import 'package:final_project_flutter/features/authetication/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<String> loginUser(String email, String password) async {
    return await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }
}
