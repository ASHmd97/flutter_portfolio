import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/data/models/showcase_project.dart';
import 'package:flutter_portfolio/feature/presentation/project_details/widgets/project_image_gallery.dart';
import 'package:flutter_portfolio/feature/presentation/project_details/widgets/info_section.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({super.key, required this.project});
  final ShowcaseProject project;

  @override
  Widget build(BuildContext context) {
    final images = project.images;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Overview',
            style: FigmaTextStyles().displaytextExtraBold.copyWith(
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.description,
                        style: FigmaTextStyles().paragraphP2Regular.copyWith(
                          color: AppColors.zinc500,
                        ),
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            InfoSection(info: project.tech),
                            InfoSection(info: project.platform),
                            InfoSection(info: project.tags),
                            InfoSection(info: project.link),
                            InfoSection(info: project.author),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// ➡️ Right Section
                if (images.isNotEmpty)
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Gallery",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 500,
                          child: CertificateTestCard(
                            animation: const AlwaysStoppedAnimation(1.0),
                            onHover: (_) {},
                            name: project.title,
                            images: images,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
