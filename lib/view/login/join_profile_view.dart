import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wishbunny/view/common/widgets/common_button.dart';
import 'package:wishbunny/view/login/widgets/login_textfield.dart';

import '../../navigator/move_navigator.dart';
import '../../viewmodel/login/join_viewmodel.dart';
import '../common/header.dart';
import '../common/height.dart';

class JoinProfileView extends StatefulWidget {
  const JoinProfileView({super.key});

  @override
  State<JoinProfileView> createState() => _JoinProfileViewState();
}

class _JoinProfileViewState extends State<JoinProfileView> {

  final ImagePicker picker = ImagePicker();
  XFile? _selected_image;

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _selected_image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override
  void initState() {
    Provider.of<JoinViewModel>(context, listen: false).initProfileView();
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
                
                      Container(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                getImage(ImageSource.gallery);
                              },
                              child: Center(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: _selected_image == null
                                    ? SvgPicture.asset('assets/login/empty_profile.svg')
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                          File(_selected_image!.path),
                                          fit: BoxFit.cover,
                                      ),
                                    ), //가
                                )
                              )
                            ),
                            Height(30),
                            LoginTextField(title: "닉네임", hint: "닉네임을 입력해주세요.",
                              onChange: (text) {
                                setState(() {
                                  provider.checkValidNickname(text);
                                });
                              }
                            ),
                            Height(10),
                            LoginTextField(title: "내 소개", hint: "한 줄 소개를 입력해주세요.",
                                onChange: (text) {
                                  setState(() {
                                    provider.checkValidIntro(text);
                                  });
                                }
                            ),
                            Height(10),
                            CommonButton(title: "다음", isActive: provider.nickname != "",
                              onTap: (){
                                moveNavigator(context, NavigatorMoveType.Push, '/tabView');
                              }
                            )
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
