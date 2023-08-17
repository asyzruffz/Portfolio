import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/pages/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Palette.colorScheme,
        useMaterial3: true,
      ),
      title: 'Muhammad Asyraf bin Ibrahim - Portfolio',
      home: HomePage(),
    );
  }
}
