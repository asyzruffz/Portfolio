import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/widgets/content_layout.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.dark,
      child: const ContentLayout(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            '© 2023 Created with Flutter by Asyraf',
            style: TextStyle(color: Palette.onPrimary),
          ),
        ),
      ),
    );
  }
}
