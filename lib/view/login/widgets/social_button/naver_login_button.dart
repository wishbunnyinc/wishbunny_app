import 'package:flutter/material.dart';

class NaverLoginButton extends StatelessWidget {
  final Function onTap;

  NaverLoginButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () async {
          onTap();
        },
        child: SizedBox(
            width: 42,
            height: 42,
            child: Image.asset('assets/login/naver_logo.png')
        ),
      ),
    );
  }
}

