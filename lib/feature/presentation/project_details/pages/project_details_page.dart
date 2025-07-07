import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/data/models/showcase_project.dart';
import 'package:flutter_portfolio/feature/presentation/project_details/widgets/project_overview.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailsView extends StatelessWidget {
  final ShowcaseProject project;
  const ProjectDetailsView({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.kPrimary,

      appBar: AppBar(
        backgroundColor: AppColors.kPrimary,
        automaticallyImplyLeading: false,

        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                project.title,
                style: FigmaTextStyles().headingH1Extrabold.copyWith(
                  color: AppColors.black,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 40),

            /// Images
            SizedBox(
              height: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: project.images.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 9 / 19.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          project.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 40),
            SizedBox(
              height: screenHeight * 0.9,
              child: ProjectOverview(project: project),
            ),
          ],
        ),
      ),
    );
  }
}

// ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           SizedBox(
//             height: screenHeight,
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: 80,
//                   right: 80,
//                   top: 80,
//                   bottom: 150,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: project.images.length,
//                       separatorBuilder: (_, __) => const SizedBox(width: 12),
//                       itemBuilder: (context, index) {
//                         return AspectRatio(
//                           aspectRatio: 9 / 19.5,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.asset(
//                               project.images[index],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),

//                 /// AppBar
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   right: 0,
//                   height: 100,
//                   child: Container(
//                     height: 300,
//                     color: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(horizontal: 50),

//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           project.title,
//                           style: FigmaTextStyles().headingH1Extrabold.copyWith(
//                             color: AppColors.black,
//                           ),
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         IconButton(
//                           onPressed: () => Navigator.of(context).pop(),
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // /// Mouse Icon
//                 // Positioned(
//                 //   right: 40,
//                 //   bottom: 20,
//                 //   child: SizedBox(
//                 //     height: 80,
//                 //     child: Column(
//                 //       mainAxisSize: MainAxisSize.min,
//                 //       children: [
//                 //         const Icon(Icons.mouse, size: 38),
//                 //         const SizedBox(height: 12),
//                 //         Container(
//                 //           width: 2,
//                 //           height: 20,
//                 //           color: Colors.grey.shade400,
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//           ProjectOverview(project: project),
//         ],
//       ),
