import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/split_tab_bar.dart';

class NavBar extends StatefulWidget {
  final Function(int)? onNavigateTo;

  const NavBar({
    super.key,
    required this.onNavigateTo,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(),
      color: Palette.background,
      elevation: 1,
      child: SizedBox(
        width: double.infinity,
        height: Ruler.navbarHeight,
        child: ContentLayout(
          child: SplitTabBar(
            controller: _tabController,
            onTap: widget.onNavigateTo,
            middle: const Center(
              child: Text(
                Tag.fullname,
                textAlign: TextAlign.center,
                style: TextStyle(color: Palette.secondary),
              ),
            ),
            tabLabels: const <String>[
              Tag.navHome,
              Tag.navAbout,
              Tag.navResume,
              Tag.navPortfolio,
              Tag.navBlog,
              Tag.navContact,
            ],
          ),
        ),
      ),
    );
  }
}
