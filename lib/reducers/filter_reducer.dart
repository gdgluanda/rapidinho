import 'package:redux/redux.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/filter_item.dart';

final filterReducer = combineReducers<FilterType>([
  TypedReducer<FilterType, UpdateFilterAction>(_activeFilterReducer)
]);

FilterType _activeFilterReducer(FilterType filterType, UpdateFilterAction action){
  return action.filterType;
}