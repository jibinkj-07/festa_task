mixin ValidationMixin {
  //validation of email address
  String? validateEmail(email) {
    if (email.toString().trim().isEmpty) {
      return 'Email is empty';
    } else if (!email.toString().trim().contains('@')) {
      return 'Provide a valid email address';
    }
    return null;
  }

  //validation of password
  String? validatePassword(password) {
    if (password.toString().trim().isEmpty) {
      return 'Password is empty';
    } else if (password.toString().trim().length < 6) {
      return 'Provide a password of length greater than 6';
    }
    return null;
  }


}
