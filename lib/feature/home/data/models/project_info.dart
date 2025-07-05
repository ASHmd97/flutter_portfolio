import 'package:flutter/material.dart';

class ProjectInfo {
  final IconData icon;
  final String label;
  bool? isTag;
  bool? isLink;
  final List<String> contents;
  // final List<String> images;
  ProjectInfo({
    required this.icon,
    required this.label,
    required this.contents,
    this.isTag = false,
    this.isLink = false,
    // this.images = const [
    //   'assets/images/projects/ai_chat_bot.png',
    //   'assets/images/projects/animated_buttons.png',
    // ],
  });
}
