class SignUpEmailAndPasswordFailure {
  final String message;

  const SignUpEmailAndPasswordFailure(
      [this.message = 'An Unknown error occurred.']);

  factory SignUpEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpEmailAndPasswordFailure(
            'Please enter a stronger password ');
      case 'Invalid-email':
        return SignUpEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SignUpEmailAndPasswordFailure(
            'An account already exists for that email');
      case 'operation-not-allowed':
        return SignUpEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support');
      case 'user-disabled':
        return SignUpEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help');
      default:
        return SignUpEmailAndPasswordFailure();
    }
  }
}
