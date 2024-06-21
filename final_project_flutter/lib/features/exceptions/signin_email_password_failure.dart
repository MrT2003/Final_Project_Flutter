class SignInEmailAndPasswordFailure {
  final String message;

  const SignInEmailAndPasswordFailure(
      [this.message = 'An Unknown error occurred.']);

  factory SignInEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignInEmailAndPasswordFailure('Invalid email format');
      case 'user-disabled':
        return const SignInEmailAndPasswordFailure('User account is disabled');
      case 'user-not-found':
        return const SignInEmailAndPasswordFailure(
            'No user found with this email');
      case 'wrong-password':
        return const SignInEmailAndPasswordFailure('Incorrect password');
      case 'user-disabled':
      default:
        return const SignInEmailAndPasswordFailure(
            'Login failed. Please try again');
    }
  }
}
