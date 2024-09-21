import 'dart:math';

import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeModel> homeData = [HomeModel(), HomeModel(), HomeModel(), HomeModel(), HomeModel(), HomeModel(), HomeModel(), HomeModel(), HomeModel()];
}

class HomeModel {
  String nickname = ["Sunshine", "NightHawk", "SilverWolf", "CrimsonStar", "EchoWave", "BluePhoenix", "MistyRain", "GoldenFox", "ThunderBolt", "ScarletDream"][Random().nextInt(10)];
  List<String> wishList = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""];
}