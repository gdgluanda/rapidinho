
import 'package:meta/meta.dart';
import 'package:rapidinho/model/navigation_tabs.dart';

@immutable
class AppState {
  final NavigationTab activeTab;

  AppState({this.activeTab = NavigationTab.Cart});

  factory AppState.init() => AppState();

  AppState copyWith({
    NavigationTab activeTab,
  }){
    return AppState(
      activeTab: activeTab ?? this.activeTab,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;

  @override
  String toString() {
    return 'AppState{activeTab: $activeTab}';
  }
}