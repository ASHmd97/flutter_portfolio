import 'package:flutter/material.dart';

class AnimatedVerticalStick extends AnimatedWidget {
  const AnimatedVerticalStick({
    super.key,
    this.width = 2,
    required this.controller,
  }) : super(listenable: controller);

  final Animation<double> controller;
  final double width;
  Animation<double> get height => Tween<double>(
    begin: 0,
    end: 100,
  ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height.value, color: Colors.black);
  }
}
