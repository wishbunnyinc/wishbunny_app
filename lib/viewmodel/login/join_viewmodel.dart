import 'package:flutter/cupertino.dart';

import '../../common/constants.dart';

class JoinViewModel with ChangeNotifier {
  var email = "";
  var isValidEmail = false;
  var isValidCertNumber = false;
  var isSendMail = false;

  var nickname = "";
  var intro = "";

  /// LifeCycle

  void initMailView() {
    email = "";
    isValidEmail = false;
    isValidCertNumber = false;
    isSendMail = false;
  }

  void initProfileView() {

  }

  /// Helper

  // 이메일 유효성 검사
  bool checkValidMail(String input) {
    email = input;
    RegExp regex = Constants.mailRegExp;
    return regex.hasMatch(input);
  }

  // 메일 전송 후 인증번호 대기
  bool certificateMail() {
    isSendMail = true;
    return true;
  }

  // 인증번호 검증
  bool checkValidCertNumber() {
    return true;
  }

  bool checkValidNickname(String input) {
    nickname = input;
    return nickname.length > 0;
  }

  void checkValidIntro(String input) {
    intro = input;
  }
}