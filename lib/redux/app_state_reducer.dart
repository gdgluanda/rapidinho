import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/tabs.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/product/product_reducer.dart';
import 'package:redux/redux.dart';

  AppState appReducer(AppState state, action){
  return AppState(
    activeTab: navigationTabsReducer(state.activeTab, action),
    filters: filterReducer(state.filters, action),
    productState: productReducer(state.productState, action),
  );
}

final filterReducer = combineReducers<List<FilterItem>>([
  TypedReducer<List<FilterItem>, UpdateFilterAction>(_activeFilterReducer),
]);

List<FilterItem> _activeFilterReducer(List<FilterItem> filters, UpdateFilterAction action){
  return filters.map((filter) => filter.type == action.type ? action.filterItem : filter).toList();
}

final navigationTabsReducer = combineReducers<NavigationTab>([
  TypedReducer<NavigationTab, UpdateTabAction>(_activeTabReducer),
]);

NavigationTab _activeTabReducer(NavigationTab activeTab, UpdateTabAction action){
  return action.newTab;
}