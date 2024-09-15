import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Header extends StatefulWidget {
  final BuildContext getContext;
  final String? title;
  final int? leftMenu; // 1 : 뒤로가기 버튼
  final int? rightMenu;
  final Function? leftFunction;
  final Function? rightFunction;

  const Header({Key? key, required this.getContext, this.title, this.leftMenu, this.rightMenu, this.leftFunction, this.rightFunction}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.leftMenu == 1
                  ? InkWell(
                    onTap: () {
                      widget.leftFunction?.call();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      height: 25,
                      width: 25,
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset('assets/common/common_back_button.png')
                      ),
                    ),
                  )
                  : Container(),
              ],
            ),
            Center(
              child: widget.title?.text.fontFamily("medium").size(18).make()
            ),
          ],
        ),
      ),
    );
  }
}
