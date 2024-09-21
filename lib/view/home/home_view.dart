import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wishbunny/view/common/hex_color.dart';

import '../../viewmodel/home/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<HomeViewModel>(builder: (context, provider, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(provider.homeData.length, (verticalIndex) {
                  var homeData = provider.homeData[verticalIndex];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: homeData.nickname.text.fontFamily("bold").size(14).align(TextAlign.left).make()
                        ),
                        Container(
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, horizontalIndex) {
                              return Container(
                                width: 100,
                                margin: EdgeInsets.only(left: horizontalIndex == 0 ? 20 : 0, top: 5, right: horizontalIndex == provider.homeData.length ? 25 : 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor.Secondary500,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        })
    );
  }
}
