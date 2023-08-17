import 'package:flutter/material.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/responsive.dart';

class ContentLayout extends StatelessWidget {
  final Widget child;

  const ContentLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200),
        child: child,
      ),
      mobile: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Ruler.fullX),
        child: child,
      ),
    );
  }
}
