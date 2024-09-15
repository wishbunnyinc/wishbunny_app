import 'package:flutter/cupertino.dart';

BottomNavigationBarItem buildBottomNavigationBarItem({String? activeIconPath, String? iconPath}) {
  return BottomNavigationBarItem(
    activeIcon: activeIconPath == null
        ? null
        : SizedBox(
      height: 20,
      width: 20,
      child: Image.asset(activeIconPath),
    ),
    icon: SizedBox(
      height: 20,
      width: 20,
      child: Image.asset(iconPath!),
    ),
    label: '',
  );
}