import 'package:final_project_flutter/features/exceptions/signin_email_password_failure.dart';
import 'package:final_project_flutter/features/exceptions/signup_email_password_failure.dart';
import 'package:final_project_flutter/pages/home_page/widgets/bottom_navigation_bar.dart';
import 'package:final_project_flutter/pages/welcome_page/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomePage())
        : Get.offAll(() => BottomNavigationBar_2());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => BottomNavigationBar_2())
          : Get.to(WelcomePage());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXECEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      final ex = SignInEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      return ex.message;
    } catch (_) {
      const ex = SignInEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      return ex.message;
    }
  }

  Future<void> logout() async {
    _auth.signOut();
    //Có cần offAll ở dưới không
    Get.offAll(() => WelcomePage());
  }
}
