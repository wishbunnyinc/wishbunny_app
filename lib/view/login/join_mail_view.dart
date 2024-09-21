import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wishbunny/view/common/widgets/common_button.dart';
import 'package:wishbunny/view/login/widgets/login_textfield.dart';

import '../../navigator/move_navigator.dart';
import '../../viewmodel/login/join_viewmodel.dart';
import '../common/header.dart';
import '../common/height.dart';
import '../common/hex_color.dart';

class JoinMailView extends StatefulWidget {
  const JoinMailView({super.key});

  @override
  State<JoinMailView> createState() => _JoinMailViewState();
}

class _JoinMailViewState extends State<JoinMailView> {

  var certFocus = FocusNode();

  @override
  void initState() {
    Provider.of<JoinViewModel>(context, listen: false).initMailView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<JoinViewModel>(builder: (context, provider, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(getContext: context, title: "회원가입", leftMenu: 1, leftFunction: () {
                      Navigator.pop(context);
                    }),
                    // Height(30),
                    Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "이메일을 입력해주세요".text.fontFamily("bold").size(18).make(),
                          Height(10),
                          "인증한 이메일로 서비스 이용에 필요한 안내와\n시기에 맞는 유용한 정보를 보내드려요.".text
                              .fontFamily("medium").color(HexColor.Secondary500).size(10).make(),
                          Height(20),
                          LoginTextField(title: "", hint: "bunny@wish.com", isValid: true, keyboardType: TextInputType.emailAddress,
                            onChange: (text) {
                              setState(() {
                                provider.isValidEmail = provider.checkValidMail(text);
                              });
                            }),
                
                          Height(10),
                          !provider.isSendMail
                            ? CommonButton(title: "인증하기", isActive: provider.isValidEmail, onTap: (){
                              setState(() {
                                bool result = provider.certificateMail();
                                if (result) {
                                  certFocus.requestFocus();
                                }
                              });
                            }) : Container(),
                
                          provider.isSendMail
                            ? LoginTextField(hint: "인증번호", keyboardType: TextInputType.number, focus: certFocus,
                              onChange: (text) {
                                setState(() {
                                  provider.isValidCertNumber = text.length >= 5;
                                });
                            }) : Container(),
                
                          Height(10),
                          provider.isSendMail
                            ? CommonButton(title: "인증완료", isActive: provider.isValidCertNumber, onTap: (){
                              bool result = provider.checkValidCertNumber();
                              if (result) {
                                moveNavigator(context, NavigatorMoveType.Push, '/joinProfileView');
                              }
                            }) : Container(),
                        ],
                      ),
                    )
                  ]
                ),
              )
            );
        })
    );
  }
}
