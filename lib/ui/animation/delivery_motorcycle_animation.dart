import 'package:flutter/material.dart';

class DeliveryMotorCycleAnimation extends StatefulWidget {
  final double width;
  final AnimationController controller;

  const DeliveryMotorCycleAnimation({Key key, this.width, this.controller})
      : super(key: key);

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<DeliveryMotorCycleAnimation> {
  final double _initialMotorcyclePadding = 16.0;
  final double _minMotorcyclePadding = 30.0;

  Animation _motorcycleAnimation;

  double get _motorcyclePadding => _minMotorcyclePadding + (1 - _motorcycleAnimation.value) * _maxMotorcyclePadding;

  double get _maxMotorcyclePadding => widget.width + _initialMotorcyclePadding;

  @override
  void initState() {
    super.initState();
    _initMotorcycleAnimations();
  }

  Widget _buildMotorcycle() {
    return AnimatedBuilder(
      animation: _motorcycleAnimation,
      child: Row(
        children: <Widget>[
          Container(
            width: 200.0,
            height: 0.5,
            color: Colors.black87,
          ),
          Image.asset(
            'assets/images/deliverables/delivery_scooter.png',
            width: 36.0,
            height: 36.0,
          ),
        ],
      ),
      builder: (context, child) => Positioned(
        right: _motorcyclePadding,
        child: child,
      ),
    );
  }

  _initMotorcycleAnimations() {
    _motorcycleAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25.0),
      width: double.infinity,
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[_buildMotorcycle()]
      ),
    );
  }
}