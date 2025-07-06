import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/data/models/quote.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';

class QuoteRotator extends StatefulWidget {
  final List<Quote> quotes;
  const QuoteRotator({super.key, required this.quotes});

  @override
  State<QuoteRotator> createState() => _QuoteRotatorState();
}

class _QuoteRotatorState extends State<QuoteRotator> {
  int currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.quotes.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quote = widget.quotes[currentIndex].name;
    final author = widget.quotes[currentIndex].author;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '"$quote"',
          style: FigmaTextStyles().displaytextMRegular,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('- $author', style: FigmaTextStyles().headingH4Regular),
          ],
        ),
      ],
    );
  }
}
