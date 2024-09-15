import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  const Height(
      this.height, {
        Key? key,
      }) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
