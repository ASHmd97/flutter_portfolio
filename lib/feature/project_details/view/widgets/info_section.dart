import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';
import 'package:flutter_portfolio/feature/home/data/models/project_info.dart';
import 'package:flutter_portfolio/feature/widgets/icon_label.dart';

class InfoSection extends StatelessWidget {
  final AnimationController controller;
  final ProjectInfo info;

  InfoSection({super.key, required this.controller, required this.info})
    : _slideUpAnimation = Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
      _fadeAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

  final Animation<Offset> _slideUpAnimation;
  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding: EdgeInsets.only(
        right: isMobile ? 10 : 100,
        bottom: isMobile ? 10 : 50,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconLabel(
            icon: info.icon,
            controller: controller,
            label: info.label,
            coverColor: Colors.white,
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),

          ...info.contents.map((content) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideUpAnimation,
                child: GestureDetector(
                  // onTap: () => content.launchWebsite(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 64.0), // 2 * 32
                    child: Text(
                      info.isTag == true
                          ? content.prefixHash()
                          : content.prefixDash(),
                      style: TextStyle(
                        decoration: info.isLink == true
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
