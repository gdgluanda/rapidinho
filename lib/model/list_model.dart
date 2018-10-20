import 'package:flutter/material.dart';
import 'package:rapidinho/model/home_card.dart';
import 'package:rapidinho/ui/widget/home_card_item.dart';

class ListModel {
  ListModel(this.listKey, items) : this.items = List.of(items);

  final GlobalKey<AnimatedListState> listKey;
  final List<HomeCard> items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, HomeCard item) {
    items.insert(index, item);
    _animatedList.insertItem(index, duration: Duration(milliseconds: 150));
  }

  HomeCard removeAt(int index) {
    final HomeCard removedItem = items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(
          index, (context, animation) => HomeCardItem('placeName', removedItem.name, (){}, AssetImage(removedItem.assetPath), animation),
          duration: Duration(milliseconds: (150 + 200*(index/length)).toInt())
      );
    }
    return removedItem;
  }

  int get length => items.length;

  HomeCard operator [](int index) => items[index];

  int indexOf(HomeCard item) => items.indexOf(item);
}
