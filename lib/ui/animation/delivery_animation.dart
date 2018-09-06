import 'package:flutter/material.dart';

class DeliveryExpandAnimation {

  DeliveryExpandAnimation(this.controller):
        containerHeight = Tween(begin: 100.0, end: 200.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> containerHeight;
}