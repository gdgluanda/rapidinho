import 'package:flutter/material.dart';
import 'package:rapidinho/ui/widget/location_pin.dart';

class DeliveryMotorCycleAnimation extends StatefulWidget {
  final double width;
  final AnimationController deliveryMotorcycleController;
  final AnimationController locationPinController;
  final AnimationController locationController;
  final int locationIndex;

  const DeliveryMotorCycleAnimation({Key key, this.width, this.deliveryMotorcycleController, this.locationPinController, this.locationController, this.locationIndex})
      : super(key: key);

  @override
  _DeliveryMotorcycleAnimationState createState() => _DeliveryMotorcycleAnimationState();
}

class _DeliveryMotorcycleAnimationState extends State<DeliveryMotorCycleAnimation> {

  final double _initialMotorcyclePadding = 16.0;
  final double _minMotorcyclePadding = 10.0;
  final List<int> _deliveryStops = [1, 2, 3];
  final double _cardWidth = 100.0;
  Animation _motorcycleAnimation;
  List<Animation<double>> _pinPositions = [];

  double get _motorcyclePadding => _minMotorcyclePadding + (1.0 - _motorcycleAnimation.value) * _maxMotorcyclePadding;

  double get _maxMotorcyclePadding => widget.width + _initialMotorcyclePadding;

  @override
  void initState() {
    super.initState();
    _initMotorcycleAnimations();
    _initLocationPinAnimations();
  }

  Widget _buildMotorcycle() {
    return AnimatedBuilder(
      animation: _motorcycleAnimation,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15.0),
            width: _deliveryStops.length * _cardWidth * 0.8,
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
      parent: widget.deliveryMotorcycleController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _initLocationPinAnimations() {
    final double slideDurationInterval = 0.4;
    final double slideDelayInterval = 0.2;
    double startingMargin = widget.width;
    double minMargin = _minMotorcyclePadding + 36.0 + 0.5 * (0.8 * _cardWidth);

    for (int i = 0; i < _deliveryStops.length; i++) {
      final start = slideDelayInterval * i;
      final end = start + slideDurationInterval;
      double finalMargin = minMargin + i * (0.8 * _cardWidth);
      Animation<double> animation = new Tween(
        begin: startingMargin,
        end: finalMargin,
      ).animate(
        new CurvedAnimation(
          parent: widget.locationPinController,
          curve: new Interval(start, end, curve: Curves.easeOut),
        ),
      );
      _pinPositions.add(animation);
    }
  }

  Widget _deliveryLocationStops(stops){
    int index = _deliveryStops.indexOf(stops);
    return LocationPin(
      controller: widget.locationController,
      animation: _pinPositions[index],
      currentLocation: index == widget.locationIndex ? true : false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25.0),
      width: double.infinity,
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[_buildMotorcycle()]..addAll(_deliveryStops.map(_deliveryLocationStops)),
      ),
    );
  }
}