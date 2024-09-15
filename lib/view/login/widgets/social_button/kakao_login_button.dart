import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/hex_color.dart';

class KakaoLoginButton extends StatelessWidget {
  final Function onTap;

  KakaoLoginButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () async {
          onTap();
        },
        child: Container(
          height: 40,
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: HexColor.kakao
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: SizedBox(width: 40, height: 40, child: Image.asset('assets/login/kakao_logo.png'))
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(right: 30),
                      child: "카카오로 계속하기".text.align(TextAlign.center).fontFamily("medium").make()
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
