import 'package:flutter/material.dart';

class SplashPageEnterAnimation {
  SplashPageEnterAnimation(this.controller, double screenHeight):
        heightSize = new Tween(begin: screenHeight, end: 100.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.700,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        ),
        logoAlignment = new Tween(begin: 0.0, end: -1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.550,
              0.700,
              curve: Curves.ease,
            ),
          ),
        ),
        logoSize = new Tween(begin: 300.0, end: 150.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.550,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        ),
        sloganOpacity = new Tween(begin: 1.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.450,
              0.550,
              curve: Curves.easeIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> heightSize;
  final Animation<double> logoAlignment;
  final Animation<double> logoSize;
  final Animation<double> sloganOpacity;
}