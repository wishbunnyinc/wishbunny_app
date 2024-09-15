import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeModel> homeData = [HomeModel(), HomeModel(), HomeModel(), HomeModel(), HomeModel()];
}

class HomeModel {
  var title = "title";
  List<String> homeList = ["aaa", "bbb", "ccc"];
}