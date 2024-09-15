import 'package:flutter/material.dart';

class FacebookLoginButton extends StatelessWidget {
  final Function onTap;

  FacebookLoginButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () async {
          onTap();
        },
        child: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset('assets/login/facebook_logo.png')
        ),
      ),
    );
  }
}

