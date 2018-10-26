import 'package:flutter/material.dart';

enum NavigationTab{Home, Delivery, Cart, Account}

class TabItem {

  final String name;
  final IconData icon;
  final int index;

  TabItem(this.name, this.icon, this.index);

  Key get key => new ValueKey<String>(name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TabItem &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              icon == other.icon &&
              index == other.index;

  @override
  int get hashCode =>
      name.hashCode ^
      icon.hashCode ^
      index.hashCode;

  @override
  String toString() {
    return 'NavigationCategory{name: $name, icon: $icon, index: $index}';
  }
}