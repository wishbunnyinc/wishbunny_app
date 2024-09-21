import 'dart:math';

import 'package:flutter/cupertino.dart';

class MyPageViewModel with ChangeNotifier {
  List<MyPageModel> myPageData = [];

  MyPageViewModel() {
    for (int i = 0; i < 20; i++) {
      myPageData.add(MyPageModel());
    }
  }
}

class MyPageModel {
  String productNames = ["스마트워치", "무선 이어폰", "블루투스 스피커", "휴대용 충전기", "스마트폰 케이스", "태블릿", "게임 콘솔", "LED 조명", "전동 칫솔", "디지털 카메라", "액션 카메라", "로봇 청소기", "가전 리모컨", "미니 프로젝터", "웨어러블 피트니스 트래커", "스마트 플러그", "차량용 공기 청정기", "휴대용 스피커", "VR 헤드셋", "스마트 홈 허브"][Random().nextInt(20)];
  int productPrices = [200000, 100000, 60000, 30000, 17000, 500000, 300000, 40000, 80000, 300000, 150000, 250000, 90000, 200000, 350000, 300000, 20000, 90000, 130000, 400000][Random().nextInt(20)];
  bool randomBooleans = [true, false, true, false, true, true, false, false, true, false, true, false, false, true, true, false, false, true, true, false][Random().nextInt(20)];

  List<String> wishList = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""];
}