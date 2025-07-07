import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_colors.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_sizes.dart';
import 'package:flutter_portfolio/feature/data/models/showcase_project.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';
import 'package:flutter_portfolio/core/routes/routes.dart';
import 'package:go_router/go_router.dart';

class AnimatedProjectCard extends AnimatedWidget {
  const AnimatedProjectCard({
    super.key,
    required this.animation,
    this.startAngle = 10,
    this.endAngle = -10,
    required this.bgColor,
    required this.project,
    this.index = 0,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final double startAngle;
  final double endAngle;
  final Color bgColor;
  final int index;
  final ShowcaseProject project;

  Animation<double> get rotateAnimation =>
      Tween<double>(begin: startAngle, end: endAngle).animate(curvedAnimation);

  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  // void navigateToProjectDetailsPage(BuildContext context) {
  //   Navigator.of(context).push(
  //     SlideRouteTransition(
  //       position: SlidePosition.right,
  //       enterWidget: ProjectDetailsView(
  //         project: project,
  //       ),
  //       settings: RouteSettings(
  //         name: '${Routes.projectDetails}/${project.title}',
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(rotateAnimation.value / 360),
      child: GestureDetector(
        onTap: () =>
            GoRouter.of(context).go('${Routes.projectDetails}/${project.id}'),
        child:
            <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AspectRatio(
                      aspectRatio: 11 / 9,
                      child: Image.asset(project.image),
                    ).addOpacity(opacity: 0.5),
                  ),
                  <Widget>[
                    Text(
                      index > 9 ? "/ $index" : "/ ${"$index".prefixZero()}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: kWhite,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      project.title,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: kWhite),
                    ),
                    verticalSpaceMedium,
                    Text(
                      project.shortDescription,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ].addColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ]
                .addStack()
                .addOpacity(opacity: 1 - curvedAnimation.value)
                .addContainer(
                  width: context.percentWidth(context.adaptive(s70, s20)),
                  height: context.percentHeight(context.adaptive(s100, s50)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(s20),
                    color: bgColor,
                  ),
                  padding: context.allPadding(p: s20),
                ),
      ),
    ).addPadding(
      edgeInsets: context.symmetricPercentPadding(
        hPercent: context.adaptive(s8, s4),
        vPercent: context.adaptive(s4, s8),
      ),
    );
  }
}
