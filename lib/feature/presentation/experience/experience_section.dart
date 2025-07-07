import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/data/const_data/experience_list.dart';
import 'package:flutter_portfolio/feature/data/models/experience_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      padding: isDesktop
          ? const EdgeInsets.symmetric(horizontal: 80, vertical: 40)
          : const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: AppColors.black,
      child: Column(
        children: [
          ExperienceTitle(),
          SizedBox(height: 48),
          ExperienceList(experienceList: experienceList),
        ],
      ),
    );
  }
}

class ExperienceList extends StatelessWidget {
  final List<ExperienceModel> experienceList;
  const ExperienceList({super.key, required this.experienceList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: experienceList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ExperienceCard(experienceModel: experienceList[index]);
      },
    );
  }
}

// ============================
// ========== TEXT ============
// ============================

class ExperienceTitle extends StatelessWidget {
  const ExperienceTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'My ',
          style: isDesktop
              ? FigmaTextStyles().displaytextRegular.copyWith(
                  color: Colors.white,
                )
              : FigmaTextStyles().displaytextMRegular.copyWith(
                  color: Colors.white,
                ),
        ),
        Text(
          'Experience',
          style: isDesktop
              ? FigmaTextStyles().displaytextExtraBold.copyWith(
                  color: Colors.white,
                )
              : FigmaTextStyles().displaytextMExtraBold.copyWith(
                  color: Colors.white,
                ),
        ),
      ],
    );
  }
}

// ============================
// ===== Experience Card ======
// ============================

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experienceModel;
  const ExperienceCard({super.key, required this.experienceModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.zinc500, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSmallScreen
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(experienceModel: experienceModel, isSmall: true),
                        const SizedBox(height: 16),
                        DateWidget(
                          startDate: experienceModel.startDate,
                          endDate: experienceModel.endDate,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Header(experienceModel: experienceModel),
                        DateWidget(
                          startDate: experienceModel.startDate,
                          endDate: experienceModel.endDate,
                        ),
                      ],
                    ),
              const SizedBox(height: 28),
              ...experienceModel.politPoint.map(
                (e) => Padding(
                  padding: isSmallScreen
                      ? const EdgeInsets.only(left: 0)
                      : const EdgeInsets.only(left: 24, bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- ',
                        style: FigmaTextStyles().paragraphP2Regular.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          e,
                          style: FigmaTextStyles().paragraphP2Regular.copyWith(
                            color: AppColors.zinc300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================
// ======== Card Header =======
// ============================

class Header extends StatelessWidget {
  final ExperienceModel experienceModel;
  final bool isSmall;
  const Header({
    super.key,
    required this.experienceModel,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: isSmall ? 40 : 60,
            height: isSmall ? 40 : 60,
            child: Image.asset(experienceModel.companyImg, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experienceModel.jobTitle,
              style: FigmaTextStyles().headingH4Semibold.copyWith(
                color: Colors.white,
                fontSize: isSmall ? 16 : null,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              experienceModel.companyName,
              style: isSmall
                  ? FigmaTextStyles().paragraphP3Regular.copyWith(
                      color: AppColors.zinc300,
                    )
                  : FigmaTextStyles().paragraphP2Regular.copyWith(
                      color: AppColors.zinc300,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

// ============================
// ====== Experience Date =====
// ============================

class DateWidget extends StatelessWidget {
  final String startDate;
  final String endDate;
  const DateWidget({super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          startDate,
          style: FigmaTextStyles().headingH6Regular.copyWith(
            color: AppColors.zinc300,
          ),
        ),
        Text(
          ' - ',
          style: FigmaTextStyles().headingH6Semibold.copyWith(
            color: AppColors.zinc300,
          ),
        ),
        Text(
          endDate,
          style: FigmaTextStyles().headingH6Regular.copyWith(
            color: AppColors.zinc300,
          ),
        ),
      ],
    );
  }
}
