import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  String image;
  FullImageScreen({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: InteractiveViewer(child: Image.asset(image)),
      ),
    );
  }
}
