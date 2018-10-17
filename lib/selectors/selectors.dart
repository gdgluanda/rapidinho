import 'package:collection/collection.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/home_card.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:rapidinho/model/app_state.dart';

NavigationTab activeTabSelector(AppState state) => state.activeTab;

/// Filter List Selectors
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

getContainingFiltersSelector(List<FilterItem> filters, List<HomeCard> homeCards){
  return homeCards.where((cardItem) => containsUnordered(cardItem.filter, activeFilterPositionSelector(filters)));
}

Function containsUnordered = DeepCollectionEquality.unordered().equals;