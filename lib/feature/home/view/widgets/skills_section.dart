import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/home/data/const_data/skills_list.dart';
import 'package:flutter_svg/svg.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    return isDesktop
        ? const SkillsSectionDesktop()
        : const SkillsSectionMobile();
  }
}

// ============================
// ========== DESKTOP =========
// ============================

class SkillsSectionDesktop extends StatelessWidget {
  const SkillsSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SkillsTitle(),
            const SizedBox(height: 48),
            const SkillsGrid(),
          ],
        ),
      ),
    );
  }
}

// ============================
// ========== MOBILE ==========
// ============================

class SkillsSectionMobile extends StatelessWidget {
  const SkillsSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: Column(
        children: [
          SkillsTitle(),
          const SizedBox(height: 48),
          const SkillsGrid(),
        ],
      ),
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

class SkillCard extends StatelessWidget {
  final String skillName;
  final String image;
  const SkillCard({super.key, required this.skillName, required this.image});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      width: 180,
      height: 180,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(image, height: 70, width: 70),
          Text(
            skillName,
            style: isDesktop
                ? FigmaTextStyles().headingH5Semibold.copyWith(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  )
                : FigmaTextStyles().headingH6Semibold.copyWith(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
        ],
      ),
    );
  }
}

// ============================
// ======= Skills Grid ========
// ============================

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        int crossAxisCount = 6;

        if (width <= 600) {
          crossAxisCount = 2;
        } else if (width <= 800) {
          crossAxisCount = 3;
        } else if (width <= 1000) {
          crossAxisCount = 4;
        } else if (width <= 1200) {
          crossAxisCount = 5;
        }

        return GridView.builder(
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
        );
      },
    );
  }
}
