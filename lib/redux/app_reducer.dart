import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/place/place_reducer.dart';
import 'package:redux/redux.dart';
import 'package:sqflite/sqflite.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    placeState: placeReducer(state.placeState, action),
    database: databaseReducer(state.database, action),
  );
}

final databaseReducer = combineReducers<Database>([
  TypedReducer<Database, DatabaseCreatedAction>(_databaseReducer),
]);

Database _databaseReducer(Database database, DatabaseCreatedAction action){
  return action.database;
}