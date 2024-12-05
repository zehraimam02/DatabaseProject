import 'package:flutter/material.dart';

class MyHeaderCell extends StatelessWidget {
  final String text;
  const MyHeaderCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
        //overflow: TextOverflow.ellipsis,
      ),
    );
  }
}