import 'package:collection/collection.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/redux/app_state.dart';

NavigationTab activeTabSelector(AppState state) => state.activeTab;

int numActiveFiltersSelector(List<FilterItem> filters) => filters.fold(0, (sum, filter) => filter.isFilter ? ++sum : sum);

List<FilterItem> activeFiltersSelector(List<FilterItem> filters){
  return filters.where((filter)=> filter.isFilter).toList();
}

List<int> activeFilterPositionSelector(List<FilterItem> filters){
  List<int> filtersInt = [];
  filters.forEach((filter){
    filtersInt.add(filters.indexOf(filter));
  });
  return filtersInt;
}

Function containsUnordered = DeepCollectionEquality.unordered().equals;