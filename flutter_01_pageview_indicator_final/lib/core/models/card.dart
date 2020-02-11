import 'package:flutter/material.dart';

class CustomCard {
  final Color color;
  final Color backGroundColor;
  final IconData icon;
  final String title;
  final String headline;
  final String buttonTitle;

  CustomCard.fromMap(data)
      : color = data['color'],
        backGroundColor = data['backGroundColor'],
        icon = data['icon'],
        title = data['title'],
        headline = data['headline'],
        buttonTitle = data['buttonTitle'];
}
