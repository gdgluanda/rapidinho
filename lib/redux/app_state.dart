import 'package:meta/meta.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/redux/place/place_state.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class AppState {
  final NavigationTab activeTab;
  final PlaceState placeState;
  final Database database;

  AppState({
    this.placeState,
    this.activeTab,
    this.database,
  });

  factory AppState.init() =>
      AppState(
        activeTab: NavigationTab.Home,
        placeState: PlaceState.initial(),
      );

  AppState copyWith({NavigationTab activeTab, PlaceState productState, Database database}){
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      placeState: productState ?? this.placeState,
      database: database ?? this.database,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              placeState == other.placeState &&
              database == other.database;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      placeState.hashCode ^
      database.hashCode;

  @override
  String toString() {
    return 'AppState{activeTab: $activeTab, placeState: $placeState, database: $database}';
  }
}