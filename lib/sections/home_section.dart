import 'package:flutter/material.dart';
import 'package:portfolio/sections/hero_section.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class HomeSection extends StatelessWidget {
  final Function(int)? onNavigateTo;

  const HomeSection({
    super.key,
    required this.onNavigateTo,
  });

  @override
  Widget build(BuildContext context) {
    double screenY = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height = screenY - padding.top - padding.bottom;

    return SliverAppBar.large(
      floating: false,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: const HeroSection(),
        title: NavBar(onNavigateTo: onNavigateTo),
        expandedTitleScale: 1.00001,
        titlePadding: const EdgeInsets.all(0),
      ),
    );
  }
}
