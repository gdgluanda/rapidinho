import 'package:rapidinho/data/data.dart';
import 'package:meta/meta.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/tabs.dart';
import 'package:rapidinho/redux/place/place_state.dart';

@immutable
class AppState {
  final NavigationTab activeTab;
  final List<FilterItem> filters;
  final PlaceState placeState;

  AppState({
    this.placeState,
    this.activeTab,
    this.filters,
  });

  factory AppState.init() =>
      AppState(
        activeTab: NavigationTab.Home,
        filters: filterList,
        placeState: PlaceState.initial()
      );

  AppState copyWith({
    NavigationTab activeTab,
    List<FilterItem> filters,
    PlaceState productState,
  }){
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      filters: filters ?? this.filters,
      placeState: productState ?? this.placeState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              filters == other.filters &&
              placeState == other.placeState;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      filters.hashCode ^
      placeState.hashCode;

  @override
  String toString() {
    return 'AppState{activeTab: $activeTab, filters: $filters, productState: $placeState}';
  }
}