import 'package:flutter/material.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/section_title.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentLayout(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Ruler.doubleX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: SectionTitle(first: 'My ', second: 'Portfolio'),
            ),
            SizedBox(height: Ruler.fullX),
          ],
        ),
      ),
    );
  }
}
