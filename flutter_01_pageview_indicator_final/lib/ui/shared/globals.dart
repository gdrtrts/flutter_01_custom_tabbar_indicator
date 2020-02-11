import 'package:flutter/material.dart';

abstract class Global {
  static const Color white = Color(0xffffffff);
  static const Color lightGrey = const Color(0xfff1f3f6);
  static const Color mediumGrey = const Color(0xffe5e7ea);
  static const Color darkGrey = const Color(0xffa3a6a9);
  static const Color lightBlue = Color(0xffF6F6FC);
  static const Color mediumBlue = Color(0xffBBB9D9);
  static const Color blue = Color(0xff332A7C);
  static const Color red = Color(0xffF25767);
  static const Color orange = Color(0xffFFA000);

  static const List cardData = [
    {
      'color': white,
      'backGroundColor': blue,
      'icon': Icons.lightbulb_outline,
      'title': 'Phase 1 Lights',
      'headline': 'Remote light configuration',
      'buttonTitle': 'View Lights',
    },
    {
      'color': white,
      'backGroundColor': red,
      'icon': Icons.videocam,
      'title': 'Phase 2 Cameras',
      'headline': 'Remote camera configuration',
      'buttonTitle': 'View Cameras',
    },
    {
      'color': white,
      'backGroundColor': orange,
      'icon': Icons.lock_outline,
      'title': 'Phase 3 Access Control',
      'headline': 'Remote access control',
      'buttonTitle': 'View Gates',
    },
  ];
}
