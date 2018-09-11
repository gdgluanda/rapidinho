import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/ui/widget/delivery_card.dart';

class DeliveryTab extends StatefulWidget {
  @override
  _DeliveryTabState createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab> with TickerProviderStateMixin {

  AnimationController cardEntranceAnimationController;
  List<Animation> cardAnimations;

  @override
  void initState() {
    super.initState();
    cardEntranceAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    );
    cardAnimations = MockData.deliveries.map((stop) {
      int index = MockData.deliveries.indexOf(stop);
      double start = index * 0.1;
      double duration = 0.6;
      double end = duration + start;
      return new Tween<double>(begin: 800.0, end: 0.0).animate(
          new CurvedAnimation(
              parent: cardEntranceAnimationController,
              curve: new Interval(start, end, curve: Curves.decelerate)));
    }).toList();
    cardEntranceAnimationController.forward();
  }

  @override
  void dispose() {
    cardEntranceAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            top: MediaQuery
                .of(context)
                .padding
                .top + 64.0,
            child: SingleChildScrollView(
              child: new Column(
                children: _buildDeliveryCards().toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Iterable<Widget> _buildDeliveryCards() {
    return MockData.deliveries.map((product) {
      int index = MockData.deliveries.indexOf(product);
      return AnimatedBuilder(
        animation: cardEntranceAnimationController,
        child: DeliveryCard(
            deliveryProduct: product
        ),
        builder: (context, child) => new Transform.translate(
          offset: Offset(0.0, cardAnimations[index].value),
          child: child,
        ),
      );
    });
  }
}