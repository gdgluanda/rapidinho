import 'package:flutter/material.dart';
import 'package:rapidinho/ui/animation/delivery_animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation ;
import 'package:rapidinho/ui/styling/rapidinho_icon.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class DeliveryCard extends StatefulWidget {
  @override
  _DeliveryCardState createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  DeliveryCardExpandAnimation _deliveryAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _deliveryAnimation = DeliveryCardExpandAnimation(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return GestureDetector(
      onTap: (){
        print('Tapped');
        _controller.isCompleted ? _controller.reverse() : _controller.forward();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child){
          return Container(
            width: double.infinity,
            height: _deliveryAnimation.containerHeight.value,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 10.0,
                  ),
                ]
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(RapidinhoIcon.timer, size: 13.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('17:06', style: RapidinhoTextStyle.smallText),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.red,
                      child: Image.asset(
                          'assets/images/deliverables/pizza.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text('Pizza Quatro Estações', style: RapidinhoTextStyle.normalText.copyWith(fontWeight: FontWeight.w600)),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(RapidinhoIcon.locationPin, size: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text('Rapidinho\'s Office', style: RapidinhoTextStyle.smallText),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
