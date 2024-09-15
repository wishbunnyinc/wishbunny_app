import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wishbunny/view/login/widgets/login_divider_widget.dart';
import 'package:wishbunny/view/login/widgets/social_button/facebook_login_button.dart';
import 'package:wishbunny/view/login/widgets/social_button/kakao_login_button.dart';
import 'package:wishbunny/view/login/widgets/social_button/mail_login_button.dart';
import 'package:wishbunny/view/login/widgets/social_button/naver_login_button.dart';

import '../../navigator/move_navigator.dart';
import '../../viewmodel/login/login_viewmodel.dart';
import '../common/height.dart';
import '../common/width.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<LoginViewModel>(builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Height(130),
                  SizedBox(width: 280, height: 280, child: Image.asset('assets/logo/logo.png')),
                  Height(30),
                  KakaoLoginButton(onTap: () async {
                    provider.kakaoLogin();
                  }),
                  Height(30),
                  LoginDividerWidget(),
                  Height(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FacebookLoginButton(onTap: (){
                        provider.facebookLogin();
                      }),
                      Width(10),
                      NaverLoginButton(onTap: (){
                        provider.naverLogin();
                      }),
                      Width(10),
                      MailLoginButton(onTap: (){
                        moveNavigator(context, NavigatorMoveType.Push, '/mailLoginView');
                      }),
                    ],
                  ),
                  Height(50),
                ],
              ),
            );
          })
      ),
    );
  }
}
