import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LocationPin extends AnimatedWidget {
  final currentLocation;
  final LocationPinAnimation pinAnimation;
  final AnimationController controller;

  LocationPin({
    Key key,
    Animation<double> animation,
    this.currentLocation,
    @required this.controller,
  }): pinAnimation = LocationPinAnimation(controller), super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Positioned(
      right: animation.value,
      bottom: 10.0,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child){
          return Icon(
            Icons.location_on,
            size: currentLocation ? pinAnimation.iconSize.value : 15.0,
            color: currentLocation ? Colors.green[700] : Colors.grey,
          );
        },
      ),
    );
  }
}

class LocationPinAnimation {

  LocationPinAnimation(this.controller):
      iconSize = Tween(begin: 15.0, end: 30.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );

  final AnimationController controller;
  final Animation<double> iconSize;
}