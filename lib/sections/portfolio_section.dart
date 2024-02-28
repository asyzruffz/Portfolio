import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/padded_card.dart';
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
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: SectionTitle(first: 'My ', second: 'Portfolio'),
            ),
            SizedBox(height: Ruler.fullX),
            ProjectGrid(
              projects: <Widget>[
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectGrid extends StatefulWidget {
  final List<Widget> projects;

  const ProjectGrid({
    super.key,
    required this.projects,
  });

  @override
  State<ProjectGrid> createState() => _ProjectGridState();
}

class _ProjectGridState extends State<ProjectGrid> {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () => controller.previousPage(),
          child: const Icon(Icons.navigate_before),
        ),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            int amountPerPage = (constraints.maxWidth / 380).floor();
            return CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                height: 650.0,
                viewportFraction: min(1 / amountPerPage, 1),
                //enlargeCenterPage: true,
              ),
              items: widget.projects,
            );
          }),
        ),
        FloatingActionButton(
          onPressed: () => controller.nextPage(),
          child: const Icon(Icons.navigate_next),
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String? image;

  const ProjectCard({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      child: Column(
        children: [
          image != null
              ? Image.asset(
                  image!,
                  width: 300.0,
                  alignment: Alignment.centerLeft,
                )
              : Container(
                  width: 300.0,
                  height: 250.0,
                  color: Palette.primary,
                ),
          const SizedBox(width: 300.0, height: 300.0),
        ],
      ),
    );
  }
}
