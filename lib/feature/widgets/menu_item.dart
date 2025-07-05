import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.label,
    this.isHovered = false,
    required this.index,
    required this.height,
    required this.onTap,
  });
  final String label;
  final bool isHovered;
  final int index;
  final double height;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    TextStyle? menuLabelStyle = context.adaptive<TextStyle?>(
      Theme.of(context).textTheme.bodyLarge,
      Theme.of(context).textTheme.titleMedium,
      md: Theme.of(context).textTheme.titleSmall,
    );
    TextStyle? hoverMenuLabelStyle = context.adaptive<TextStyle?>(
      Theme.of(context).textTheme.titleSmall,
      Theme.of(context).textTheme.headlineSmall,
      md: Theme.of(context).textTheme.titleMedium,
    );
    double stickWidth = context.adaptive<double>(50, 100, md: 70);
    return <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            width: isHovered ? stickWidth : 0,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          AnimatedDefaultTextStyle(
            style: isHovered
                ? Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)
                : Theme.of(context).textTheme.bodySmall!,
            duration: Duration(milliseconds: 100),
            child: Text(
              '${index + 1}'.prefixZero(),
            ).addOpacity(opacity: isHovered ? 1 : 0.5),
          ),

          AnimatedDefaultTextStyle(
            style: isHovered ? hoverMenuLabelStyle! : menuLabelStyle!,
            duration: Duration(milliseconds: 100),
            child: Text(label).addOpacity(opacity: isHovered ? 1 : 0.5),
          ),
        ]
        .addRow()
        .addContainer(decoration: const BoxDecoration(border: Border()))
        .addInkWell(onTap: onTap);
  }
}
