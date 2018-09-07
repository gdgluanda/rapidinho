import 'package:flutter/material.dart';

class DeliveryCardExpandAnimation {

  DeliveryCardExpandAnimation(this.controller):
        containerHeight = Tween(begin: 80.0, end: 180.0).animate(
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