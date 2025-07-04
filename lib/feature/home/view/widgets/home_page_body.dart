import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/experience/experience_section.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/hero/hero_section.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/skills/skills_section.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeroSection(),
          const SkillsSection(),
          const ExperienceSection(),
        ],
      ),
    );
  }
}
