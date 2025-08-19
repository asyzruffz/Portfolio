import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/content_data.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/helper.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/section_title.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentLayout(
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
              projects: ContentData.projects
                  .map((project) => ProjectCard(data: project))
                  .toList(),
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
  final CarouselSliderController controller = CarouselSliderController();

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
                enlargeCenterPage: true,
                enlargeFactor: 0.1,
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
  final ProjectData data;

  const ProjectCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.background,
        border: Border.all(color: Palette.secondary),
      ),
      child: Column(
        children: [
          data.image != null
              ? Image.asset(
                  data.image!,
                  width: 300.0 + Ruler.fullX + Ruler.halfX,
                  height: 250.0 + Ruler.threeQuarterX,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: 300.0 + Ruler.fullX + Ruler.halfX,
                  height: 250.0 + Ruler.threeQuarterX,
                  color: Palette.primary,
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Ruler.threeQuarterX),
              child: SizedBox(
                width: 300.0,
                child: ListView(
                  children: <Widget>[
                    Text(
                      data.name,
                      style:
                          const TextStyle(fontSize: 20, color: Palette.primary),
                    ),
                    const SizedBox(height: Ruler.miniX),
                    Text(
                      data.description,
                      style: TextStyle(fontSize: 14, color: Palette.secondary),
                    ),
                    const SizedBox(height: Ruler.miniX),
                    Wrap(
                      spacing: Ruler.miniX,
                      runSpacing: Ruler.miniX,
                      children: data.links
                          .map((link) => FilledButton(
                                onPressed: link.url != null
                                    ? () => Helper.goUrl(link.url!)
                                    : () {},
                                style: FilledButton.styleFrom(
                                  backgroundColor: link.url != null
                                      ? Palette.tertiary
                                      : Palette.primary,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Ruler.halfX,
                                    vertical: 0.0,
                                  ),
                                ),
                                child: link.icon != null
                                    ? Icon(link.icon)
                                    : Text(link.label ?? ''),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
