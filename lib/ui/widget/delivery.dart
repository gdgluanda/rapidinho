import 'package:flutter/material.dart';
import 'package:rapidinho/ui/animation/delivery_animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation ;

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  DeliveryExpandAnimation _deliveryAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _deliveryAnimation = DeliveryExpandAnimation(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.5;
    return GestureDetector(
      onTap: (){
        print('Tapped');
        _controller.isCompleted ? _controller.reverse() : _controller.forward();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child){
          return Container(
            height: _deliveryAnimation.containerHeight.value,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 1.0,
                  ),
                ]
            ),
          );
        }
      ),
    );
  }
}
