
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../hex_color.dart';
import '../width.dart';

enum CheckBoxSize {
  small, medium, big
}

class CommonCheckButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final CheckBoxSize size;
  final Function(bool) onTap;

  CommonCheckButton({required this.title, required this.size, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(!isActive);
      },
      child: Row(
        children: [
          SizedBox(
            width: size == CheckBoxSize.small ? 20 : size == CheckBoxSize.medium ? 25 : 30,
            height: 20,
            child: Checkbox(
              value: isActive,
              activeColor: HexColor.Primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              side: MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(width: isActive ? 0.0 : 1.5, color: HexColor.Secondary300),
              ), onChanged: (bool? value) {
                onTap(!isActive);
              },
            ),
          ),
          Width(5),
          title.text.align(TextAlign.left).fontFamily("medium").color(isActive ? Colors.black : HexColor.Secondary700)
              .size(size == CheckBoxSize.small ? 10 : size == CheckBoxSize.medium ? 14 : 18).make(),
        ],
      ),
    );
  }
}
