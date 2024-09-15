import 'package:flutter/material.dart';

class Width extends StatelessWidget {
  const Width(
      this.width, {
        Key? key,
      }) : super(key: key);

  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
