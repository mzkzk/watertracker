import 'package:flutter/material.dart';

class DrinkButton extends StatelessWidget {
  final int amount;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const DrinkButton({
    super.key,
    required this.amount,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: onPressed,
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 5),
        Text('$amount مل'),
        Text(label),
      ],
    );
  }
}