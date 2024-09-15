import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  // 메인 색상
  static var Primary = HexColor("2596be");
  static var Error100 = HexColor("ffbeba");
  static var Error200 = HexColor("ff7c75");
  static var Error300 = HexColor("d30b00");
  static var Warning100 = HexColor("fff2aa");
  static var Warning200 = HexColor("ffe455");
  static var Warning300 = HexColor("b39600");

  // Grey 계열
  static var Secondary100 = HexColor("E7EBEF");
  static var Secondary200 = HexColor("DAE1E7");
  static var Secondary300 = HexColor("CED7DE");
  static var Secondary400 = HexColor("C2CDD6");
  static var Secondary500 = HexColor("B6C3CD");
  static var Secondary600 = HexColor("92A5B5");
  static var Secondary700 = HexColor("7991A4");
  static var Secondary800 = HexColor("637D92");
  static var Secondary900 = HexColor("4A5E6D");
  static var Secondary1000 = HexColor("323F49");

  // 특정 계열
  static var kakao = HexColor("FEE500");
}
