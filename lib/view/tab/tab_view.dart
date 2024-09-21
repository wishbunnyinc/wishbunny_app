
import 'package:flutter/material.dart';
import 'package:wishbunny/view/tab/widgets/bottom_navigation_bar_item.dart';

import '../addWish/add_wish_popup_view.dart';
import '../home/home_view.dart';
import '../myPage/my_page_view.dart';
import '../search/search_view.dart';
import '../shopping/shopping_view.dart';

enum TabItem { home, search, addWish, shopping, myPage }

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  /// Properties

  var currentTap = TabItem.home;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    // TabItem.addWish: GlobalKey<NavigatorState>(),
    TabItem.shopping: GlobalKey<NavigatorState>(),
    TabItem.myPage: GlobalKey<NavigatorState>(),
  };

  /// LifeCycle

  @override
  void initState() {
    super.initState();
  }

  /// Helper

  void _selectTab(TabItem tabItem) async {
    if (tabItem == TabItem.addWish) {
      showModalBottomSheet<void>(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return AddWishPopupView();
        },
      );
    } else {
      setState(() {
        currentTap = tabItem;
      });
    }
  }

  /// Configure View

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: Stack(
            children: TabItem.values.map((item) => _buildOffstageNavigator(item)).toList(),
          ),
          bottomNavigationBar: Container(
            child: SizedBox(
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentTap.index,
                  items: TabItem.values.map((item) =>
                      buildBottomNavigationBarItem(activeIconPath: "assets/tabView/tab_${item.name}.png", iconPath: "assets/tabView/tab_${item.name}.png")).toList(),
                  onTap: (index) =>
                      _selectTab(TabItem.values[index]),
                )
            ),
          )
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return Offstage(
          offstage: currentTap != TabItem.home,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKeys[tabItem],
            initialRoute: '/homeView',
            routes: {
              '/homeView': (context) => HomeView(),
            },
          ),
        );

      case TabItem.search:
        return Offstage(
          offstage: currentTap != TabItem.search,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKeys[tabItem],
            initialRoute: '/searchView',
            routes: {
              '/searchView': (context) => SearchView(),
            },
          ),
        );

      case TabItem.addWish:
        return Container();

      case TabItem.shopping:
        return Offstage(
          offstage: currentTap != TabItem.shopping,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKeys[tabItem],
            initialRoute: '/shoppingView',
            routes: {
              '/shoppingView': (context) => ShoppingView(),
            },
          ),
        );

      case TabItem.myPage:
        return Offstage(
          offstage: currentTap != TabItem.myPage,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKeys[tabItem],
            initialRoute: '/myPageView',
            routes: {
              '/myPageView': (context) => MyPageView(),
            },
          ),
        );
    }
  }
}
