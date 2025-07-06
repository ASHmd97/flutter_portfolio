import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.coverColor,
    this.textStyle,
  });

  final IconData icon;
  final String label;
  final Color coverColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Colors.black),
        const SizedBox(width: 16),
        Container(
          color: AppColors.kPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(label, style: textStyle),
        ),
      ],
    );
  }
}
