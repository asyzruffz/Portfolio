import 'package:flutter/material.dart';

class Palette {
  static const Color primary = Color(0xFFF85C70);
  static const Color secondary = Color(0xFF6c757d);

  static const Color background = Colors.white;
  static const Color dark = Color(0xFF343a40);
  static const Color onPrimary = Colors.white;

  static const Color disabled = Colors.black12;

  static const ColorScheme colorScheme = ColorScheme.light(
    primary: primary,
    secondary: secondary,
  );
}
