import 'package:rapidinho/data/data.dart';
import 'package:meta/meta.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/navigation_tabs.dart';

@immutable
class AppState {
  final NavigationTab activeTab;
  final List<FilterItem> filters;

  AppState({
    this.activeTab = NavigationTab.Home,
    this.filters = filterList,
  });

  factory AppState.init() => AppState();

  AppState copyWith({
    NavigationTab activeTab,
    List<FilterItem> filters,
  }){
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      filters: filters ?? this.filters,
    );
  }
}