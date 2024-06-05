import 'package:final_project_flutter/features/exceptions/signup_email_password_failure.dart';
import 'package:final_project_flutter/pages/home_page/bottom_navigation_bar.dart';
import 'package:final_project_flutter/pages/login/login_page.dart';
import 'package:final_project_flutter/pages/register/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => SignUpPage())
        : Get.offAll(() => BottomNavigationBar_2());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => BottomNavigationBar_2())
          : Get.to(LoginPage());
    } on FirebaseAuthException catch (e) {
      final ex = SigUpEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXECEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SigUpEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async {
    _auth.signOut();
  }
}