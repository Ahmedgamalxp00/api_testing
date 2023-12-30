import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              style: const TextStyle(fontSize: 24, color: Colors.blue),
              text: text1,
            ),
            TextSpan(
              text: text2,
            )
          ]),
    );
  }
}
