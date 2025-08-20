import 'package:flutter/widgets.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.vertical(
        bottom: Radius.circular(Ruler.halfX),
      ),
      child: Image.asset(Tag.backgroundImage, fit: BoxFit.cover),
    );
  }
}
