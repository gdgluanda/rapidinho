
import 'package:meta/meta.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/navigation_tabs.dart';

@immutable
class AppState {
  final NavigationTab activeTab;
  final FilterType filterType;

  AppState({this.activeTab = NavigationTab.Home, this.filterType = FilterType.All});

  factory AppState.init() => AppState();

  AppState copyWith({
    NavigationTab activeTab,
    FilterType filterType,
  }){
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      filterType: filterType ?? this.filterType,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              filterType == other.filterType;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      filterType.hashCode;

  @override
  String toString() {
    return 'AppState{activeTab: $activeTab, filterType: $filterType}';
  }
}