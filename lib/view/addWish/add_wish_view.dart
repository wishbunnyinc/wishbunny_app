import 'package:flutter/material.dart';

class AddWishView extends StatefulWidget {
  const AddWishView({super.key});

  @override
  State<AddWishView> createState() => _AddWishViewState();
}

class _AddWishViewState extends State<AddWishView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("AddWish")),
    );
  }
}