import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/navigation_tabs.dart';

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
  final FilterType filterType;

  UpdateFilterAction(this.filterType);

  @override
  String toString() {
    return 'UpdateFilterAction{filterType: $filterType}';
  }
}