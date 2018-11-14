import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:sqflite/sqflite.dart';

class InitAction {}
class DatabaseCreatedAction{
  final Database database;

  DatabaseCreatedAction(this.database);

  @override
  String toString() {
    return 'DatabaseCreatedAction{database: $database}';
  }
}

class ErrorCreatingDatabase{}
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