import 'package:flutter/material.dart';

class CertificateTestCard extends StatelessWidget {
  const CertificateTestCard({
    super.key,
    required this.animation,
    required this.onHover,
    required this.images,
    required this.name,
  });

  final List<String> images;
  final String name;
  final Animation<double> animation;
  final Function(bool) onHover;

  Animation<double> getCurvedAnimation(Animation<double> animation) {
    return CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  }

  Animation<double> getOpacityAnimation(Animation<double> animation) {
    return Tween<double>(
      begin: 1.0,
      end: 0.2,
    ).animate(getCurvedAnimation(animation));
  }

  @override
  Widget build(BuildContext context) {
    final opacityAnimation = getOpacityAnimation(animation);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return GestureDetector(
          onTap: () => showImagesDialog(context),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(images.first, fit: BoxFit.fitWidth),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Opacity(
                      opacity: 1 - opacityAnimation.value,
                      child: IconButton(
                        onPressed: () => showImagesDialog(context),
                        icon: const Icon(Icons.play_arrow),
                      ),
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Opacity(
                //     opacity: 1 - opacityAnimation.value,
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           name,
                //           style: Theme.of(context).textTheme.bodyLarge
                //               ?.copyWith(fontWeight: FontWeight.w700),
                //           textAlign: TextAlign.center,
                //         ),
                //         const SizedBox(height: 16),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showImagesDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              IconButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          content: SizedBox(
            width: 500,
            height: 500,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (_, index) => Image.asset(images[index]),
            ),
          ),
        );
      },
    );
  }
}
