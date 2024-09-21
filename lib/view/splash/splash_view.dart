import 'package:flutter/material.dart';

import '../../navigator/move_navigator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // 2초 후 homeView로 이동
    Future.delayed(const Duration(seconds: 0), () {

      //TODO: 추후 isLogin으로 변경
      if (true) {
        moveNavigator(context, NavigatorMoveType.Push, '/tabView');
      } else {
        moveNavigator(context, NavigatorMoveType.Push, '/loginView');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
