import 'package:flutter/cupertino.dart';

enum NavigatorMoveType {
  Push;
}
void moveNavigator(BuildContext context, NavigatorMoveType type, String path, {Map<String, dynamic>? arguments}) {
  switch (type) {
    case NavigatorMoveType.Push:
      Navigator.of(context, rootNavigator: true).pushNamed(path);
  }
}