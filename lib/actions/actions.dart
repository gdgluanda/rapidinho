import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:rapidinho/model/place.dart';

class InitAction {}

class UpdateTabAction {
  final NavigationTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}

class UpdateFilterAction {
  final FilterItem filterItem;
  final FilterType type;

  UpdateFilterAction(this.filterItem, this.type);

  @override
  String toString() {
    return 'UpdateFilterAction{filterItem: $filterItem, type: $type}';
  }
}