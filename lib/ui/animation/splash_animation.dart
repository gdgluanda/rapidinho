import 'package:flutter/material.dart';

class SplashPageEnterAnimation {
  SplashPageEnterAnimation(this.controller, double screenHeight):
        heightSize = new Tween(begin: screenHeight, end: kToolbarHeight).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        ),
        logoAlignment = new Tween(begin: 0.0, end: -0.920).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              1.0,
              curve: Curves.ease,
            ),
          ),
        ),
        logoWidth = new Tween(begin: 300.0, end: 120.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        ),
        logoHeight = new Tween(begin: 300.0, end: kToolbarHeight).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        ),
        sloganOpacity = new Tween(begin: 1.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.700,
              curve: Curves.easeIn,
            ),
          ),
        ),
        actionButtonOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.700,
              1.0,
              curve: Curves.easeIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> heightSize;
  final Animation<double> logoAlignment;
  final Animation<double> logoWidth;
  final Animation<double> logoHeight;
  final Animation<double> sloganOpacity;
  final Animation<double> actionButtonOpacity;
}