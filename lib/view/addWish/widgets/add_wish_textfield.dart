import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/hex_color.dart';

class AddWishTextField extends StatefulWidget {
  final Function(String) onTap;

  AddWishTextField({required this.onTap});

  @override
  State<AddWishTextField> createState() => AddWishTextField_State();
}

class AddWishTextField_State extends State<AddWishTextField> {
  var url = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "medium",
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 90),
              hintText: "링크를 붙여넣어주세요",
              hintStyle: TextStyle(
                color: HexColor.Secondary300,
                fontSize: 14,
                fontFamily: "medium",
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: HexColor.Secondary500,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
            onChanged: (text){
              setState(() {
                url = text;
              });
            },
          ),
        ),

        Positioned(
          right: 3,
          top: 1,
          child: MaterialButton(
            padding: EdgeInsets.zero,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () async {
              widget.onTap(url);
            },
            child: Container(
                height: 35,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: HexColor.Primary,
                ),
                child: Center(child: "저장".text.align(TextAlign.center).size(14).color(Colors.white).fontFamily("medium").make())
            ),
          ),
        )
      ],
    );
  }
}
