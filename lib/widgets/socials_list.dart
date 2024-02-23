import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
import 'package:portfolio/helper.dart';

class SocialsList extends StatelessWidget {
  final Color? color;

  const SocialsList({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Ruler.miniX,
      children: [
        IconButton(
          onPressed: () => Helper.goUrl(Tag.linkedinLink),
          icon: FaIcon(
            FontAwesomeIcons.linkedin,
            size: Ruler.iconNormal,
            color: color,
          ),
        ),
        IconButton(
          onPressed: () => Helper.goUrl(Tag.githubLink),
          icon: FaIcon(
            FontAwesomeIcons.github,
            size: Ruler.iconNormal,
            color: color,
          ),
        ),
        IconButton(
          onPressed: () => Helper.goUrl(Tag.mastodonLink),
          icon: FaIcon(
            FontAwesomeIcons.mastodon,
            size: Ruler.iconNormal,
            color: color,
          ),
        ),
        IconButton(
          onPressed: () => Helper.goUrl(Tag.emailLink),
          icon: Icon(
            Icons.mail,
            size: Ruler.iconNormal,
            color: color,
          ),
        ),
      ],
    );
  }
}
