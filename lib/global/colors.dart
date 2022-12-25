import 'package:flutter/material.dart';

class MyColors {
  // static const Color prime = Color(0xFF0F0F0F);
  static const Color prime = Color(0xFF101010);

  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Color(0xFFf6f6f6);

  // note colors
  static const Color pastelPink = Color(0xfffff1f4);
  static const Color pastelOrange = Color(0xffffefe8);
  static const Color pastelGreen = Color(0xffe8fcf7);
  static const Color pastelBlue = Color(0xffe5f5ff);
  static const Color pastelPurple = Color(0xffeff0ff);

  // category colors
  static const Color brightPink = Color(0xfffe5572);
  static const Color brightOrange = Color(0xffff8c4e);
  static const Color brightGreen = Color(0xff2fff77);
  static const Color brightBlue = Color(0xff41a0ff);
  static const Color brightPurple = Color(0xff4e57ff);

  static Map<String, Color> colorMap = {
    'pink': pastelPink,
    'orange': pastelOrange,
    'green': pastelGreen,
    'blue': pastelBlue,
    'purple': pastelPurple,
  };
  static Map<String, Color> brightColorMap = {
    'pink': brightPink,
    'orange': brightOrange,
    'green': brightGreen,
    'blue': brightBlue,
    'purple': brightPurple,
  };
}
