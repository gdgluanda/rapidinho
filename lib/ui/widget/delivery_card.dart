import 'package:flutter/material.dart';
import 'package:rapidinho/model/delivery.dart';
import 'dart:async';
import 'package:rapidinho/ui/animation/delivery_motorcycle_animation.dart';
import 'package:rapidinho/ui/animation/delivery_animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation ;
import 'package:rapidinho/styling/rapidinho_icon.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class DeliveryCard extends StatefulWidget {

  final Delivery deliveryProduct;

  DeliveryCard({@required this.deliveryProduct});

  @override
  _DeliveryCardState createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> with TickerProviderStateMixin {

  AnimationController _controller;
  DeliveryCardExpandAnimation _deliveryAnimation;
  AnimationController _deliveryMotorcycleController;
  AnimationController _locationPinAnimationController;
  AnimationController _locationController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    )..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _deliveryMotorcycleController.forward();
        Future.delayed(Duration(milliseconds: 300), () {
          _locationPinAnimationController.forward();
        });
      }
    });
    _deliveryAnimation = DeliveryCardExpandAnimation(_controller);
    _deliveryMotorcycleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _locationPinAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000)
    )..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _locationController.forward().orCancel;
      }
    });
    _locationController = new AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _deliveryMotorcycleController.dispose();
    _locationPinAnimationController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return GestureDetector(
      onTap: (){
        _controller.isCompleted ? _controller.reverse() : _controller.forward();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child){
          return Container(
            width: double.infinity,
            height: _deliveryAnimation.containerHeight.value,
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                  ),
                ]
            ),
            child: Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints){
                      return Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: DeliveryMotorCycleAnimation(
                          width: constraints.maxWidth,
                          deliveryMotorcycleController: _deliveryMotorcycleController,
                          locationPinController: _locationPinAnimationController,
                          locationController: _locationController,
                          locationIndex: widget.deliveryProduct.locationIndex,
                        ),
                      );
                    }
                ),
                Opacity(
                  opacity: _controller.value,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      splashColor: Colors.grey,
                      highlightColor: Colors.blueGrey,
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.map, color: Colors.blueGrey),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text('Visualizar no mapa', style: RapidinhoTextStyle.smallText),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(RapidinhoIcon.timer, size: 13.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('${widget.deliveryProduct.time.minute}:${widget.deliveryProduct.time.second}', style: RapidinhoTextStyle.smallText),
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
                      child: Image.asset(widget.deliveryProduct.details.assetPath),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(widget.deliveryProduct.name, style: RapidinhoTextStyle.normalText.copyWith(fontWeight: FontWeight.w600)),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(RapidinhoIcon.doubleLocationPin, size: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(widget.deliveryProduct.locationName, style: RapidinhoTextStyle.smallText),
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
