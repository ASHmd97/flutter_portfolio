import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/responsive/responsive.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return desktop;
    } else if (Responsive.isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
