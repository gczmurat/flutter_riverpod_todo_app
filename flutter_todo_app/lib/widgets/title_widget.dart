import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "todo app",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.purple, fontSize: 70, fontWeight: FontWeight.w300),
    );
  }
}
