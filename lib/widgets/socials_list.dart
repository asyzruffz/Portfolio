import 'package:flutter/material.dart';
import 'package:portfolio/constants/ruler.dart';

class SocialsList extends StatelessWidget {
  final Color? color;

  const SocialsList({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.facebook, size: Ruler.iconNormal, color: color),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.mail, size: Ruler.iconNormal, color: color),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.code, size: Ruler.iconNormal, color: color),
        ),
      ],
    );
  }
}
