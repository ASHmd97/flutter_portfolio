import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/data/models/project_info.dart';
import 'icon_label.dart';

class InfoSection extends StatelessWidget {
  final ProjectInfo info;

  const InfoSection({super.key, required this.info});

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconLabel(
            icon: info.icon,
            label: info.label,
            coverColor: Colors.white,
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          ...info.contents.map((content) {
            final text = info.isTag == true ? '#$content' : '- $content';

            return Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                text,
                style: TextStyle(
                  decoration: info.isLink == true
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: Colors.black26,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
