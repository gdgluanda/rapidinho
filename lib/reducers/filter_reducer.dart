import 'package:redux/redux.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/filter_item.dart';

final filterReducer = combineReducers<List<FilterItem>>([
  TypedReducer<List<FilterItem>, UpdateFilterAction>(_activeFilterReducer),
]);

List<FilterItem> _activeFilterReducer(List<FilterItem> filters, UpdateFilterAction action){
  return filters.map((filter) => filter.type == action.type ? action.filterItem : filter).toList();
}