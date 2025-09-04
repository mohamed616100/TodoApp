abstract class Validator {
  static String? valditorconfirmpassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "confirm password is required";
    }
    if (value != password) {
      return "password does not match";
    }
    return null;
  }

  static String? valditorpassword(String? value) {
    if (value == null || value.isEmpty) {
      return "password is required";
    }
    if (value.length < 6) {
      return "password must be at least 6 characters";
    }
    return null;
  }

  static String? valditoremail(String? value) {
    var emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value!)) {
      return "please enter a valid email";
    }
    return null;
  }

}


