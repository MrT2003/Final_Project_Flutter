class SigUpEmailAndPasswordFailure {
  final String message;

  const SigUpEmailAndPasswordFailure(
      [this.message = 'An Unknown error occurred.']);

  factory SigUpEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SigUpEmailAndPasswordFailure(
            'Please enter a stronger password ');
      case 'Invalid-email':
        return SigUpEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SigUpEmailAndPasswordFailure(
            'An account already exists for that email');
      case 'operation-not-allowed':
        return SigUpEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support');
      case 'user-disabled':
        return SigUpEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help');
      default:
        return SigUpEmailAndPasswordFailure();
    }
  }
}
