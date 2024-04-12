import 'package:flutter/material.dart';

class EnemyAvatar extends StatelessWidget {
  final String name;
  final String image;

  const EnemyAvatar({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 100,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image), // Replace with your image path
            ),
          ),
        ),
        Text(name),
      ],
    );
  }
}