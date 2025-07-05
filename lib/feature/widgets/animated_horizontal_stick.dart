import 'package:flutter/material.dart';

class AnimatedHorizontalStick extends AnimatedWidget {
  const AnimatedHorizontalStick({
    super.key,
    this.height = 2,
    required this.controller,
  }) : super(listenable: controller);

  final Animation<double> controller;
  final double height;
  Animation<double> get width => Tween<double>(
    begin: 0,
    end: 100,
  ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: width.value, color: Colors.black);
  }
}
