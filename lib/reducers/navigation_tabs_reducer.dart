import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:redux/redux.dart';

final navigationTabsReducer = combineReducers<NavigationTab>([
  TypedReducer<NavigationTab, UpdateTabAction>(_activeTabReducer),
]);

NavigationTab _activeTabReducer(NavigationTab activeTab, UpdateTabAction action){
  return action.newTab;
}