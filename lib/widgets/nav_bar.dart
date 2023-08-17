import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/content_layout.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TabBar(
                controller: _tabController,
                isScrollable: true,
                onTap: widget.onNavigateTo,
                indicator: const UnderlineTabIndicator(),
                tabs: const <Widget>[
                  Tab(text: "Home"),
                  Tab(text: "About"),
                  Tab(text: "Resume"),
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                ],
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Asyraf',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Palette.secondary),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                onTap: widget.onNavigateTo,
                indicator: const UnderlineTabIndicator(),
                tabs: const <Widget>[
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                  Tab(text: "Portfolio"),
                  Tab(text: "Blog"),
                  Tab(text: "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
