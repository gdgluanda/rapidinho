import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rapidinho/styling/rapidinho_icon.dart';

class LocationPin extends AnimatedWidget {
  final currentLocation;
  final AnimationController controller;

  LocationPin({
    Key key,
    Animation<double> animation,
    this.currentLocation,
    @required this.controller,
  }): super(key: key, listenable: animation);

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
            RapidinhoIcon.locationPin,
            size: 15.0,
            color: Colors.grey,
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