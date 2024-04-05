import 'package:flutter/material.dart';

class MealItemChar extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealItemChar({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 6),
        Text(
          label,
          style:  const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
