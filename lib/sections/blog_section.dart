import 'package:flutter/material.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/section_title.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Ruler.doubleX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: SectionTitle(first: 'Latest ', second: 'News'),
            ),
            const SizedBox(height: Ruler.fullX),
            ..._populateBlogContents(),
          ],
        ),
      ),
    );
  }

  List<Widget> _populateBlogContents() {
    List<Widget> items = [];
    int count = 1;
    for (var i = 0; i < count; i++) {
      items.add(const BlogCard());

      if (i < count - 1) {
        items.add(const SizedBox(height: 32));
      }
    }

    return items;
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Placeholder(),
      ],
    );
  }
}
