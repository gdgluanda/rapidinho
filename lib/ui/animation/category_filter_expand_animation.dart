import 'package:flutter/material.dart';

class CategoryFilterExpandExpandAnimation {

  CategoryFilterExpandExpandAnimation(this.controller):
        containerHeight = Tween(begin: 0.0, end: 50.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.easeInOut,
            ),
            reverseCurve: Curves.easeInOut,
          ),
        );

  final AnimationController controller;
  final Animation<double> containerHeight;
}