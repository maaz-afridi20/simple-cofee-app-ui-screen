import 'package:flutter/material.dart';

class CofeeTypes extends StatelessWidget {
  final String cofeeType;
  final bool isSelected;
  final VoidCallback onTap;

  CofeeTypes({
    required this.cofeeType,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          cofeeType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
