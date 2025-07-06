import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/responsive/responsive.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/core/data/const_data/skills_list.dart';
import 'package:flutter_portfolio/feature/skills/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),
        const SkillsTitle(),
        const SizedBox(height: 28),
        const SkillsGrid(),
        const SizedBox(height: 48),
      ],
    );
  }
}

// ============================
// ========== TEXT ============
// ============================

class SkillsTitle extends StatelessWidget {
  const SkillsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'My ',
          style: isDesktop
              ? FigmaTextStyles().displaytextRegular
              : FigmaTextStyles().displaytextMRegular,
        ),
        Text(
          'Skills',
          style: isDesktop
              ? FigmaTextStyles().displaytextExtraBold
              : FigmaTextStyles().displaytextMExtraBold,
        ),
      ],
    );
  }
}

// ============================
// ======= Skill Card =========
// ============================

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 6;
        if (Responsive.isMobile(context)) {
          crossAxisCount = 2;
        } else if (Responsive.isSmallTablet(context)) {
          crossAxisCount = 4;
        } else if (Responsive.isTablet(context)) {
          crossAxisCount = 5;
        } else if (Responsive.isDesktop(context)) {
          crossAxisCount = 6;
        }

        return Padding(
          padding: Responsive.isMobile(context)
              ? const EdgeInsets.all(16)
              : Responsive.isSmallTablet(context)
              ? const EdgeInsets.all(32)
              : const EdgeInsets.symmetric(vertical: 24, horizontal: 80),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemCount: skillsList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => SkillCard(
              skillName: skillsList[index].title,
              image: skillsList[index].image,
            ),
          ),
        );
      },
    );
  }
}
