import 'package:flutter/widgets.dart';
import 'package:portfolio/constants/tag.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0.0,
          right: -500.0,
          top: -50.0,
          bottom: 0.0,
          child: Image.asset(Tag.backgroundImage, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
