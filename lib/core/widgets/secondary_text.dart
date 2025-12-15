import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  const SecondaryText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
