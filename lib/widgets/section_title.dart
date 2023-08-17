import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';

class SectionTitle extends StatelessWidget {
  final String first;
  final String second;

  const SectionTitle({
    super.key,
    required this.first,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Text>[
        Text(
          first,
          style: const TextStyle(
            height: 1,
            fontSize: 32,
            color: Palette.primary,
          ),
        ),
        Text(
          second,
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
