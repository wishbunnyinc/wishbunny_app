import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../hex_color.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final bool? isActive;
  final Function onTap;

  CommonButton({required this.title, this.isActive = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () async {
        if (isActive!) {
          onTap();
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isActive! ? HexColor.Primary : HexColor.Secondary500
        ),
        child: Center(child: title.text.align(TextAlign.center).size(14).color(Colors.white).fontFamily("medium").make())
      ),
    );
  }
}
