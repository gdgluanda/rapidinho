import 'package:flutter/material.dart';

enum NavigationTab{Home, Delivery, Cart, Account}

class TabItem {

  final String name;
  final IconData icon;
  final NavigationTab tab;

  TabItem(this.name, this.icon, this.tab);

  Key get key => new ValueKey<String>(name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TabItem &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              icon == other.icon &&
              tab == other.tab;

  @override
  int get hashCode =>
      name.hashCode ^
      icon.hashCode ^
      tab.hashCode;

  @override
  String toString() {
    return 'NavigationCategory{name: $name, icon: $icon, index: $tab}';
  }
}