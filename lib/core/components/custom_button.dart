import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final String? icon;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.color,
    required this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null && icon!.isNotEmpty
          ? FittedBox(child: Image.asset(icon!, width: 24, height: 24,))
          : const SizedBox.shrink(),
      label: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
