import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/height.dart';
import '../../common/hex_color.dart';

class LoginTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool? obscure;
  final bool? isValid;
  final TextInputType? keyboardType;
  final FocusNode? focus;
  final Function(String)? onChange;
  final Function(String)? onComplete;

  LoginTextField({this.title = "", this.hint = "", this.obscure = false, this.isValid = true, this.keyboardType = TextInputType.text, this.focus = null, this.onChange, this.onComplete});

  @override
  Widget build(BuildContext context) {
    var text = "";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ""
          ? title!.text.align(TextAlign.left).fontFamily("medium").color(HexColor.Secondary700).size(10).make()
          : Container(),
        Height(title != "" ? 5 : 0),
        Container(
          height: 50,
          child: TextField(
            focusNode: focus,
            keyboardType: keyboardType,
            cursorColor: Colors.black,
            obscureText: obscure!,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "medium",
            ),
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: hint,
                hintStyle: TextStyle(
                  color: HexColor.Secondary300,
                  fontSize: 14,
                  fontFamily: "medium",
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: isValid! ? HexColor.Secondary500 : HexColor.Error200,
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
              text = text;
              if (onChange != null) {
                onChange!(text);
              }
            },
            onEditingComplete: (){
              if (onComplete != null) {
                onComplete!(text);
              }
            },
          ),
        )
      ],
    );
  }
}

