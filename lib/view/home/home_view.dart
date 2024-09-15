import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<HomeViewModel>(builder: (context, provider, child) {
        return Center(child: Text("Home"));
        // return ScrollConfiguration(
        //   behavior: const ScrollBehavior().copyWith(overscroll: false),
        //   child: ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       shrinkWrap: true,
        //       itemCount: provider.homeData.length,
        //       itemBuilder: (context, index) {
        //         var homeData = provider.homeData[index];
        //         return Column(
        //           crossAxisAlignment: CrossAxisAlignment.stretch,
        //           children: [
        //             Text(homeData.title),
        //             // ScrollConfiguration(
        //             //   behavior: const ScrollBehavior().copyWith(overscroll: false),
        //             //   child: ListView.builder(
        //             //     scrollDirection: Axis.horizontal,
        //             //     itemCount: homeData.homeList.length,
        //             //     itemBuilder: (context, index) {
        //             //         var item = homeData.homeList[index];
        //             //         return Text(item);
        //             //     }
        //             //   ),
        //             // ),
        //           ],
        //         );
        //       }
        //   ),
        // );
      })
    );
  }
}
