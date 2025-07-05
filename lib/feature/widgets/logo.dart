import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(20, 80, md: 60);
    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scaleX: -1,
        child: SvgPicture.asset(
          'kaLogo',
          semanticsLabel: 'Logo SVG',
          width: size,
          height: size,
        ),
      ).addPadding(edgeInsets: context.padding(l: 10)),
    );
  }
}
