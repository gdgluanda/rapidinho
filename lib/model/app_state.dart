import 'package:rapidinho/data/data.dart';
import 'package:meta/meta.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:rapidinho/repository/place_entity.dart';

@immutable
class AppState {
  final NavigationTab activeTab;
  final List<FilterItem> filters;
  final List<Result> places;
  final bool isLoading;

  AppState({
    this.places,
    this.activeTab = NavigationTab.Home,
    this.filters = filterList,
    this.isLoading = false,
  });

  factory AppState.init() => AppState(isLoading: true);

  AppState copyWith({
    NavigationTab activeTab,
    List<FilterItem> filters,
    List<Result> places,
    bool isLoading,
  }){
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      filters: filters ?? this.filters,
      places: places ?? this.places,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              filters == other.filters &&
              places == other.places &&
              isLoading == other.isLoading;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      filters.hashCode ^
      places.hashCode ^
      isLoading.hashCode;

  @override
  String toString() {
    return 'AppState{activeTab: $activeTab, filters: $filters, places: $places, isLoading: $isLoading}';
  }
}