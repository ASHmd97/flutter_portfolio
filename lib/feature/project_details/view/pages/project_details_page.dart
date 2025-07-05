import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/home/data/models/showcase_project.dart';
import 'package:flutter_portfolio/feature/project_details/view/widgets/project_overview.dart';

class ProjectDetailsView extends StatefulWidget {
  final ShowcaseProject project;
  const ProjectDetailsView({super.key, required this.project});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView>
    with TickerProviderStateMixin {
  late AnimationController _appBarController;
  late AnimationController _mouseIconController;
  late AnimationController _stickController;
  late AnimationController _titleController;
  late Animation<Offset> _appBarAnimation;
  late Animation<double> _mouseOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _appBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _stickController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _titleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _mouseIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _appBarAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_appBarController);

    _mouseOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_mouseIconController);

    Future.delayed(const Duration(milliseconds: 2000), () {
      _appBarController.forward();
      _appBarController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _titleController.forward();
        }
      });
      _mouseIconController.forward();
      _stickController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _appBarController.dispose();
    _mouseIconController.dispose();
    _stickController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Positioned(
                left: 80,
                right: 80,
                top: 80,
                bottom: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
              SlideTransition(
                position: _appBarAnimation,
                child: Container(
                  height: 100,
                  width: screenWidth,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeTransition(
                        opacity: _titleController,
                        child: Text(
                          project.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 40,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeTransition(
                      opacity: _mouseOpacityAnimation,
                      child: const Icon(Icons.mouse, size: 38),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 2,
                      height: 20,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ProjectOverview(project: project),
        ],
      ),
    );
  }
}
