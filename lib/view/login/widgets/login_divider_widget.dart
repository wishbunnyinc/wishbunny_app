import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/hex_color.dart';
import '../../common/width.dart';

class LoginDividerWidget extends StatelessWidget {
  const LoginDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:1.0,
              color: HexColor.Secondary100,
            ),
          ),
          Width(15),
          "또는".text.color(HexColor.Secondary500).size(12).fontFamily("medium").make(),
          Width(15),
          Expanded(
            child: Container(
              height: 1.0,
              color: HexColor.Secondary100,
            ),
          ),
        ],
      ),
    );
  }
}
