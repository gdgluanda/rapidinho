import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:rapidinho/ui/container/active_tab.dart';
import 'package:rapidinho/ui/widget/delivery_card.dart';

class DeliveryTab extends StatefulWidget {

  DeliveryTab();

  @override
  _DeliveryTabState createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab> with TickerProviderStateMixin {

  AnimationController cardEntranceAnimationController;
  List<Animation> cardAnimations;
  ValueNotifier<int> currentTab;

  @override
  void initState() {
    super.initState();
    cardEntranceAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    cardAnimations = MockData.deliveries.map((stop) {
      int index = MockData.deliveries.indexOf(stop);
      double start = index * 0.1;
      double duration = 0.6;
      double end = duration + start;
      return Tween<double>(begin: 800.0, end: 0.0).animate(
          new CurvedAnimation(
              parent: cardEntranceAnimationController,
              curve: Interval(start, end, curve: Curves.decelerate)));
    }).toList();
    cardEntranceAnimationController.forward();
    currentTab = ValueNotifier(1);
    currentTab.addListener((){
      cardEntranceAnimationController.reverse();
    });
  }

  @override
  void dispose() {
    cardEntranceAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      builder: (context, activeTab){
        currentTab.value = activeTab.index;
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
                  child: Column(
                    children: _buildDeliveryCards().toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
        builder: (context, child) => Transform.translate(
          offset: Offset(0.0, cardAnimations[index].value),
          child: child,
        ),
      );
    });
  }
}