class SignInEmailAndPasswordFailure {
  final String message;

  const SignInEmailAndPasswordFailure(
      [this.message = 'An Unknown error occurred.']);

  factory SignInEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return SignInEmailAndPasswordFailure('Invalid email format');
      case 'user-disabled':
        return SignInEmailAndPasswordFailure('User account is disabled');
      case 'user-not-found':
        return SignInEmailAndPasswordFailure('No user found with this email');
      case 'wrong-password':
        return SignInEmailAndPasswordFailure('Incorrect password');
      case 'user-disabled':
      default:
        return SignInEmailAndPasswordFailure('Login failed. Please try again');
    }
  }
}
