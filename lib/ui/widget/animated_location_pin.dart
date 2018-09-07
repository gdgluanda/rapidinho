import 'package:flutter/material.dart';

class AnimatedLocationPin extends AnimatedWidget {
  final currentLocation;

  AnimatedLocationPin({
    Key key,
    Animation<double> animation,
    this.currentLocation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Positioned(
      right: animation.value,
      bottom: 10.0,
      child: Icon(
        Icons.location_on,
        size: currentLocation ? 30.0 : 15.0,
        color: currentLocation ? Colors.green[700] : Colors.grey,
      ),
    );
  }
}
