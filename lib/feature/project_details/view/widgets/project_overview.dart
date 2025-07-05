import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';

import 'package:flutter_portfolio/feature/home/data/models/showcase_project.dart';
import 'package:flutter_portfolio/feature/project_details/view/widgets/project_image_gallery.dart';
import 'package:flutter_portfolio/feature/widgets/animated_text_slide_box_transition.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'info_section.dart';

class ProjectOverview extends StatefulWidget {
  const ProjectOverview({super.key, required this.project});
  final ShowcaseProject project;

  @override
  State<ProjectOverview> createState() => _ProjectOverviewState();
}

class _ProjectOverviewState extends State<ProjectOverview>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _contentController;
  late AnimationController _controller;

  void detectVisibility(VisibilityInfo info) {
    if (info.visibleFraction > 0.45) {
      _titleController.forward();
      _titleController.addStatusListener(_titleControllerListener);
    } else {
      if (_titleController.isCompleted) {
        _titleController.reset();
      }
      if (_contentController.isCompleted) {
        _contentController.reset();
      }
    }
  }

  void _titleControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _contentController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _contentController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.project.images;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextSlideBoxTransition(
          controller: _titleController,
          text: 'Project Overview',
          coverColor: Colors.white,
          textStyle: MediaQuery.of(context).size.width > 900
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context).textTheme.bodyMedium,
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ⬅️ Left Section: Description + Info
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedTextSlideBoxTransition(
                      controller: _contentController,
                      text: widget.project.description,
                      coverColor: Colors.white,
                      textStyle: MediaQuery.of(context).size.width > 900
                          ? Theme.of(context).textTheme.bodyLarge
                          : Theme.of(context).textTheme.bodyMedium,
                      maxLines: 15,
                    ),

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
                          InfoSection(
                            controller: _contentController,
                            info: widget.project.tech,
                          ),
                          InfoSection(
                            controller: _contentController,
                            info: widget.project.platform,
                          ),
                          InfoSection(
                            controller: _contentController,
                            info: widget.project.tags,
                          ),
                          InfoSection(
                            controller: _contentController,
                            info: widget.project.link,
                          ),
                          InfoSection(
                            controller: _contentController,
                            info: widget.project.author,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// ➡️ Right Section: Gallery Card
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

                      AspectRatio(
                        aspectRatio: 9 / 19.5,
                        child: CertificateTestCard(
                          animation: _controller,
                          onHover: (_) => _controller.forward(),
                          name: widget.project.title,
                          images: images,
                        ),
                      ),

                      Text(
                        "Tap to view gallery",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ).addVisibilityDetector(onDetectVisibility: detectVisibility),
      ],
    );
  }
}
