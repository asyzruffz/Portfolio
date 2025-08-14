import 'package:flutter/material.dart';
import 'package:portfolio/constants/content_data.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
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
            ..._spacingBlogContents(
                ContentData.blogs.map((blog) => BlogCard(data: blog)).toList()),
          ],
        ),
      ),
    );
  }

  List<Widget> _spacingBlogContents(List<Widget> contents) {
    List<Widget> items = [];
    int count = 3;
    for (var i = 0; i < contents.length; i++) {
      items.add(contents[i]);

      if (i < count - 1) {
        items.add(const SizedBox(height: 32));
      }
    }

    return items;
  }
}

class BlogCard extends StatelessWidget {
  final BlogData data;

  const BlogCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        border: Border.all(color: Palette.secondary),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          data.image != null
              ? Image.asset(
                  data.image!,
                  width: 300.0,
                  alignment: Alignment.centerLeft,
                )
              : Container(width: 300.0, color: Palette.primary),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Ruler.threeQuarterX),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data.title, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: Ruler.miniX),
                  Text(
                    'Posted on ${data.date}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Palette.secondary,
                    ),
                  ),
                  const SizedBox(height: Ruler.halfX),
                  Expanded(
                    child: Text(
                      data.summary,
                      maxLines: 7,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Palette.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: Ruler.halfX),
                  TextButton(
                    onPressed: () {},
                    child: const Text(Tag.labelReadMore),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
