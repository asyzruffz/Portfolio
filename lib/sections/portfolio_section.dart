import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
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
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: SectionTitle(first: 'My ', second: 'Portfolio'),
            ),
            SizedBox(height: Ruler.fullX),
            ProjectGrid(
              projects: <Widget>[
                ProjectCard(
                  name: 'BiO-X',
                  image: Tag.projImage1,
                ),
                ProjectCard(
                  name: 'ObserVR 2',
                  image: Tag.projImage3,
                ),
                ProjectCard(
                  name: 'Claustro Escalade',
                  image: Tag.projImage4,
                ),
                ProjectCard(
                  name: 'Stomp',
                  image: Tag.projImage5,
                ),
                ProjectCard(
                  name: 'Fowlcard',
                  image: Tag.projImage6,
                ),
                ProjectCard(
                  name: 'See You Again',
                  image: Tag.projImage7,
                ),
                ProjectCard(
                  name: 'Find Out Yourself',
                  image: Tag.projImage8,
                ),
                ProjectCard(
                  name: 'Oath',
                  image: Tag.projImage9,
                ),
                ProjectCard(
                  name: 'Trapped in Egypt',
                  image: Tag.projImage10,
                ),
                ProjectCard(
                  name: 'Tetronihome',
                  image: Tag.projImage11,
                ),
                ProjectCard(
                  name: 'Where\'s My Channel?!',
                  image: Tag.projImage12,
                ),
                ProjectCard(
                  name: 'Lost Frequency',
                  image: Tag.projImage13,
                ),
                ProjectCard(
                  name: 'Hex-a-cute',
                  image: Tag.projImage14,
                ),
                ProjectCard(
                  name: 'Bicker Fight',
                  image: Tag.projImage15,
                ),
                ProjectCard(
                  name: 'Eterium 2139',
                  image: Tag.projImage16,
                ),
                ProjectCard(
                  name: 'Ejen Escape',
                  image: Tag.projImage17,
                ),
                ProjectCard(
                  name: 'Light\'s ON',
                  image: Tag.projImage18,
                ),
                ProjectCard(
                  name: 'Procedural Floating Island',
                  image: Tag.projImage2,
                ),
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
  final String name;
  final String? image;

  const ProjectCard({
    super.key,
    required this.name,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Palette.secondary),
      ),
      child: Column(
        children: [
          image != null
              ? Image.asset(
                  image!,
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
                    Text(name, style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: Ruler.miniX),
                    const Text(
                      'Description ...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Palette.secondary,
                      ),
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
