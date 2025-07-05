import 'dart:math';
import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
    this.hasMenuTapped = false,
  }) : super(key: key);
  final VoidCallback onPressed;
  final bool hasMenuTapped;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(30, 65, md: 40);
    double difference = context.adaptive<double>(5, 20, md: 10);
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child:
            Icon(
              hasMenuTapped ? Atlas.xmark_circle : Atlas.two_line_bold,
              size: size - difference,
              color: Colors.black,
            ).addCenter().addContainer(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              width: size,
              height: size,
            ),
      ),
    );
  }
}
