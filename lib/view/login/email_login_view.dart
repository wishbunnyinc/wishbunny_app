import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wishbunny/view/common/header.dart';
import 'package:wishbunny/view/common/widgets/common_button.dart';
import 'package:wishbunny/view/common/widgets/common_check_button.dart';
import 'package:wishbunny/view/login/widgets/join_agreement_popup_view.dart';
import 'package:wishbunny/view/login/widgets/login_textfield.dart';
import 'package:wishbunny/viewmodel/login/mail_login_viewmodel.dart';

import '../../navigator/move_navigator.dart';
import '../common/height.dart';
import '../common/hex_color.dart';
import '../common/width.dart';

class MailLoginView extends StatefulWidget {
  const MailLoginView({super.key});

  @override
  State<MailLoginView> createState() => _MailLoginViewState();
}

class _MailLoginViewState extends State<MailLoginView> {

  @override
  void initState() {
    Provider.of<MailLoginViewModel>(context, listen: false).initViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Consumer<MailLoginViewModel>(builder: (context, provider, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(getContext: context, title: "이메일 아이디로 로그인", leftMenu: 1, leftFunction: () {
                    Navigator.pop(context);
                  }),
              
                  Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginTextField(title: "이메일 아이디", hint: "bunny@wish.com", isValid: provider.isValidEmail, keyboardType: TextInputType.emailAddress,
                          onChange: (text) {
                            setState(() {
                              provider.isValidEmail = provider.checkValidMail(text);
                            });
                          }),
              
                        (!provider.isValidEmail)
                            ? "유효한 이메일을 입력해주세요.".text.fontFamily("medium").color(HexColor.Error200).size(10).make()
                            : Container(),
              
                        Height(20),
                        LoginTextField(title: "비밀번호", hint: "문자, 숫자 포함 8-20자", obscure: !provider.isShowPassword, isValid: provider.isValidPassword,
                          onChange: (text) {
                            setState(() {
                              provider.isValidPassword = provider.checkValidPassword(text);
                            });
                          }
                        ),
              
                        (!provider.isValidPassword)
                          ? "문자, 숫자 포함 8-20자로 입력해주세요.".text.fontFamily("medium").color(HexColor.Error200).size(10).make()
                          : Container(),
              
                        Height(10),
                        CommonCheckButton(title: "비밀번호 표시", size: CheckBoxSize.small, isActive: provider.isShowPassword, onTap: (isShow){
                          setState(() {
                            provider.isShowPassword = isShow;
                          });
                        }),
                        Height(20),
                        CommonButton(isActive: provider.isValidLogin, title: "로그인", onTap: () {
                          moveNavigator(context, NavigatorMoveType.Push, '/tabView');
                        }),
                        Height(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                                onTap: (){
              
                                },
                                child: "1:1 문의".text.fontFamily("medium").color(HexColor.Secondary500).size(10).make()
                            ),
                            Width(5),
                            "|".text.fontFamily("medium").color(HexColor.Secondary500).size(10).make(),
                            Width(5),
                            GestureDetector(
                                onTap: (){
                                  showModalBottomSheet<void>(
                                    context: context,
                                    useSafeArea: true,
                                    builder: (BuildContext context) {
                                      return JoinAgreementPopupView(tapAgreeAll: (isTap){
                                          setState(() {
                                            provider.isAgreeAll.toggle();
                                          });
                                      }, tapJoin: (){
                                        Navigator.pop(context);
                                        moveNavigator(context, NavigatorMoveType.Push, '/joinMailView');
                                      });
                                    },
                                  );
                                },
                                child: "회원가입".text.fontFamily("medium").color(HexColor.Secondary500).size(10).make()
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        })
    );
  }
}
