import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';

class RoundedImageContainer extends StatelessWidget {
  RoundedImageContainer({
    super.key,
    required this.width,
    this.color = Colors.black,
    this.borderRadius = 18,
    this.margin = 5,
    this.beginAlignment = Alignment.centerLeft,
    this.endAlignment = Alignment.centerRight,
    required this.animation,
    this.labelStyle,
    required this.index,
    required this.imageUrl,
    required this.tag,
  }) : alignAnimation = Tween<AlignmentGeometry>(
         begin: beginAlignment,
         end: endAlignment,
       ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
  final double width;
  final Color color;
  final double borderRadius;
  final double margin;
  final Alignment beginAlignment;
  final Alignment endAlignment;
  final Animation<AlignmentGeometry> alignAnimation;
  final Animation<double> animation;
  TextStyle? labelStyle;
  final int index;
  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return context.adaptive(
      projectImageWidget(context),
      projectImageWidget(context).addExpanded(),
    );
  }

  Widget projectImageWidget(BuildContext context) {
    final imageHeight = context.percentHeight(24);
    String label = '$index'.prefixZero();
    labelStyle =
        labelStyle ??
        context.adaptive(
          Theme.of(context).textTheme.bodySmall,
          Theme.of(context).textTheme.bodyMedium,
        );
    return AlignTransition(
      alignment: alignAnimation,
      child: <Widget>[
        Container(
          width: width,
          height: context.adaptive(imageHeight, null),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        Positioned(
          right: -20,
          bottom: -30,
          width: width * 0.6,
          child: Hero(
            tag: tag,
            child: AspectRatio(
              aspectRatio: 11 / 9,
              child: Image.asset(imageUrl),
            ).addOpacity(opacity: 0.5),
          ),
        ),
        Positioned(bottom: 0, left: 20, child: Text(label, style: labelStyle)),
      ].addStack(),
    ).addPadding(edgeInsets: context.allPadding(p: margin));
  }
}
