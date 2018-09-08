import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/ui/widget/delivery_card.dart';

class DeliveryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100.0),
      child: ListView(
        children: MockData.deliveries.map((product){
          return DeliveryCard(
            deliveryProduct: product,
          );
        }).toList(),
      ),
    );
  }
}
