import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../hex_color.dart';

class CommonRadiusButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onTap;

  CommonRadiusButton({required this.title, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () async {
        onTap();
      },
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 1, color: isActive ? HexColor.Primary : HexColor.Secondary500),
          ),
          child: Center(
            child: title.text.align(TextAlign.center).size(14).fontFamily("medium")
                .color(isActive ? HexColor.Primary : HexColor.Secondary500).make(),
          )
      ),
    );
  }
}
