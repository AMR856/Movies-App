class Validators {
  Validators._();

  static String? validateName(String? name){
    if (name == null || name.trim().isEmpty) {
      return "Name is Required";
    }
    if (name.length < 4) {
      return "Name should be at least 4 chars";
    }
    return null;
  }

  static String? validateEmail(String? email){
    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "Email is required";
    }
    if(!regExp.hasMatch(email)){
      return "E-mail Bad Format";
    }
    return null;

  }

  static String? validatePassword(String? password){
    RegExp regExp =  RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (password == null || password.trim().isEmpty) {
      return "Password is required";
    }
    if(!regExp.hasMatch(password)){
      return "Weak Password (Must contain: uppercase, lowercase, number, special char, and 8+ length)";
    }
    return null;
  }
}