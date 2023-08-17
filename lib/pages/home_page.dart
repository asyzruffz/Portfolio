import 'package:flutter/material.dart';
import 'package:portfolio/sections/about_section.dart';
import 'package:portfolio/sections/blog_section.dart';
import 'package:portfolio/sections/contact_section.dart';
import 'package:portfolio/sections/footer_section.dart';
import 'package:portfolio/sections/home_section.dart';
import 'package:portfolio/sections/portfolio_section.dart';
import 'package:portfolio/sections/resume_section.dart';

class HomePage extends StatefulWidget {
  final List<GlobalKey> sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  void _navigateTo(int index) {
    if (index == 0) {
      _controller.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Scrollable.ensureVisible(
        widget.sectionKeys[index].currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          HomeSection(
            key: widget.sectionKeys[0],
            onNavigateTo: _navigateTo,
          ),
          SliverToBoxAdapter(
            key: widget.sectionKeys[1],
            child: const AboutSection(),
          ),
          SliverToBoxAdapter(
            key: widget.sectionKeys[2],
            child: const ResumeSection(),
          ),
          SliverToBoxAdapter(
            key: widget.sectionKeys[3],
            child: const PortfolioSection(),
          ),
          SliverToBoxAdapter(
            key: widget.sectionKeys[4],
            child: const BlogSection(),
          ),
          SliverToBoxAdapter(
            key: widget.sectionKeys[5],
            child: const ContactSection(),
          ),
          const SliverToBoxAdapter(
            child: FooterSection(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
