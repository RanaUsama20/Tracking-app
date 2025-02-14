import 'package:easy_localization/easy_localization.dart';

class Validator {
  Validator._();

  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null) {
      return 'this field is required';
    } else if (val.trim().isEmpty) {
      return 'this field is required';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    if (val == null) {
      return 'this field is required';
    } else if (val.isEmpty) {
      return 'this field is required';
    }
    else if (!passwordRegex.hasMatch(val)) {
      return 'Password must be at least 8 characters long \n and include at least \n one uppercase letter, \n one lowercase letter, \n and a number';
    }
    else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required'.tr();
    } else if (val != password) {
      return "password doesn't match password".tr();
    } else {
      return null;
    }
  }

  static String? validateAge(String? val) {
    if (val == null) {
      return 'this field is required'.tr();
    } else if (val.isEmpty) {
      return 'this field is required'.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return 'enter numbers only'.tr();
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return 'this field is required'.tr();
    } else {
      return null;
    }
  }



  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return 'this field is required'.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return 'enter numbers only'.tr();
    } else if (val.trim().length != 11) {
      return 'enter value must equal 11 digit'.tr();
    } else {
      return null;
    }
  }
}
