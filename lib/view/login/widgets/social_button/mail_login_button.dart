import 'package:flutter/material.dart';

import '../../../common/hex_color.dart';

class MailLoginButton extends StatelessWidget {
  final Function onTap;

  MailLoginButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () async {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            border: Border.all(
              width: 1,
              color: HexColor.Secondary300,
            ),
          ),
          child: SizedBox(width: 20, height: 20, child: Image.asset('assets/login/mail_logo.png')),
        ),
      ),
    );
  }
}

