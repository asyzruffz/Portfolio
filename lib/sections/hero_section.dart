import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/socials_list.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
            child: Container(color: Colors.pink)), // TODO: Use image
        SizedBox.expand(
          child: ContentLayout(
            child: Padding(
              padding: const EdgeInsets.only(
                top: Ruler.halfX,
                bottom: Ruler.navbarHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SocialsList(color: Palette.onPrimary),
                  Expanded(flex: 2, child: Container()),
                  const Text(
                    'Hello, I am',
                    style: TextStyle(fontSize: 64, height: 1),
                  ),
                  const SizedBox(height: Ruler.miniX),
                  const Text(
                    'Asyraf',
                    style: TextStyle(fontSize: 128, height: 1),
                  ),
                  const SizedBox(height: Ruler.miniX),
                  const Text(
                    'Software Developer | Game Developer | Programmer',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: Ruler.fullX),
                  const DownloadResumeButton(),
                  Expanded(flex: 3, child: Container()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadResumeButton extends StatelessWidget {
  const DownloadResumeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: Ruler.miniX),
        child: Text('Download Resume', style: TextStyle(fontSize: 18)),
      ),
      onPressed: () {},
    );
  }
}
