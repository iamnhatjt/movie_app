class Validator {
  static String? validateEmail(String? email) {
    if (email == null || email.trim() == '') {
      return 'Email is not empty...';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Email Wrong...';
    } else {
      return null;
    }
  }

  static String? validatePassWord(String? password) {
    if (password == null || password.trim() == '') {
      return 'Password is not empty';
    }
    return null;
  }
}
