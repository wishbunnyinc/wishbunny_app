import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wishbunny/view/common/widgets/common_button.dart';
import 'package:wishbunny/view/common/widgets/common_check_button.dart';

import '../../common/height.dart';
import '../../common/hex_color.dart';
import '../../common/widgets/common_radius_button.dart';
import '../../common/width.dart';

class JoinAgreementPopupView extends StatefulWidget {
  final Function(bool) tapAgreeAll;
  final Function tapJoin;

  const JoinAgreementPopupView({super.key, required this.tapAgreeAll, required this.tapJoin});

  @override
  State<JoinAgreementPopupView> createState() => _JoinAgreementPopupViewState();
}

class _JoinAgreementPopupViewState extends State<JoinAgreementPopupView> {
  bool isAgreeAll = false;
  bool isAgree1 = false;
  bool isAgree2 = false;

  void _tapAgreeAll(isTap) {
    isAgreeAll = isTap;
    widget.tapAgreeAll(isTap);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: HexColor('#ffffff'), // 모달 배경색
        borderRadius: const BorderRadius.all(
          Radius.circular(20), // 모달 전체 라운딩 처리
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Height(20),
          "위시버니와 함께하려면\n아래 약관 동의가 필요해요!".text.fontFamily("bold").size(18).make(),
          Height(20),
          CommonCheckButton(title: "모두 동의합니다.", size: CheckBoxSize.medium, isActive: isAgreeAll, onTap: (isTap){
            setState(() {
              isAgree1 = isTap;
              isAgree2 = isTap;
              _tapAgreeAll(isAgree1 && isAgree2);
            });
          }),
          Height(15),
          Container(
            height:1.0,
            width: double.infinity,
            color: HexColor.Secondary100,
          ),
          Height(15),
          Row(
            children: [
              Flexible(
                child: CommonCheckButton(title: "(필수) 이용약관 동의", size: CheckBoxSize.medium, isActive: isAgree1, onTap: (isTap){
                  setState(() {
                    isAgree1 = isTap;
                    _tapAgreeAll(isAgree1 && isAgree2);
                  });
                }),
              ),
              GestureDetector(
                onTap: (){
                  launchUrl(
                    Uri.parse('https://resisted-attraction-a19.notion.site/1002da8eecaa80659d34e9b0cdc5a586?pvs=4'),
                  );
                },
                child: SvgPicture.asset('assets/common/common_arrow_right.svg', color: HexColor.Secondary700)
              )
            ],
          ),
          Height(15),
          Row(
            children: [
              Flexible(
                child: CommonCheckButton(title: "(필수) 개인정보 처리 방침", size: CheckBoxSize.medium, isActive: isAgree2, onTap: (isTap){
                  setState(() {
                    isAgree2 = isTap;
                    _tapAgreeAll(isAgree1 && isAgree2);
                  });
                }),
              ),
              GestureDetector(
                  onTap: (){
                    launchUrl(
                      Uri.parse('https://resisted-attraction-a19.notion.site/1002da8eecaa8033b967d44ff55ab638?pvs=4'),
                    );
                  },
                  child: SvgPicture.asset('assets/common/common_arrow_right.svg', color: HexColor.Secondary700)
              )
            ],
          ),
          Height(30),
          Row(
            children: [
              Flexible(
                child: CommonRadiusButton(title: "취소", isActive: false, onTap: (){
                  Navigator.pop(context);
                }),
              ),
              Width(10),
              Flexible(
                child: CommonButton(title: "동의하고 가입", isActive: isAgreeAll, onTap: (){
                  if (isAgreeAll) {
                    widget.tapJoin();
                  }
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}
