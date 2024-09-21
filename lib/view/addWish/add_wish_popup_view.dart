import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wishbunny/view/addWish/widgets/add_wish_textfield.dart';
import 'package:wishbunny/viewmodel/addWish/add_wish_viewmodel.dart';

import '../common/height.dart';
import '../common/hex_color.dart';

class AddWishPopupView extends StatefulWidget {

  const AddWishPopupView({super.key});

  @override
  State<AddWishPopupView> createState() => _AddWishPopupViewState();
}

class _AddWishPopupViewState extends State<AddWishPopupView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 200,
        width: double.infinity,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            "링크 저장하기".text.fontFamily("medium").size(16).make(),
            Height(20),
            AddWishTextField(onTap: (url){
              var vm = Provider.of<AddWishViewModel>(context, listen: false);
              vm.searchWishItem(url);
            })
          ],
        ),
      ),
    );
  }
}
