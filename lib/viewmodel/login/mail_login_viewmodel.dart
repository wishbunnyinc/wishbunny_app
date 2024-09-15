import 'package:flutter/cupertino.dart';

import '../../common/constants.dart';

class MailLoginViewModel with ChangeNotifier {
  var email = "";
  var password = "";

  var isShowPassword = false;
  var isAgreeAll = false;

  var isValidEmail = true;
  var isValidPassword = true;
  get isValidLogin => (email != "" && password != "" && isValidEmail && isValidPassword);

  initViewModel() {
    email = "";
    password = "";
    isShowPassword = false;
    isAgreeAll = false;
    isValidEmail = true;
    isValidPassword = true;
  }

  // 이메일 유효성 검사
  bool checkValidMail(String input) {
    email = input;
    RegExp regex = Constants.mailRegExp;
    return regex.hasMatch(input);
  }

  // 비밀번호 유효성 검사
  bool checkValidPassword(String input) {
    password = input;
    if (input.length < 8 || input.length > 20) {
      return false;
    }
    RegExp regex = Constants.passwordRegExp;
    return regex.hasMatch(input);
  }

  void login() {

  }
}