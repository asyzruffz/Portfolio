import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';

class TopicTitle extends StatelessWidget {
  final String text;
  final double? fontSize;

  const TopicTitle(
    this.text, {
    super.key,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: fontSize ?? 32, height: 1),
        ),
        const SizedBox(height: Ruler.miniX),
        Container(
          width: Ruler.fullX,
          height: 2,
          color: Palette.primary,
        ),
      ],
    );
  }
}
