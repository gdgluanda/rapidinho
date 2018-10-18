import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/reducers/navigation_tabs_reducer.dart';
import 'package:rapidinho/reducers/filter_reducer.dart';
import 'package:rapidinho/reducers/loading_reducer.dart';
import 'package:rapidinho/reducers/places_reducer.dart';

  AppState appReducer(AppState state, action){
  return AppState(
    activeTab: navigationTabsReducer(state.activeTab, action),
    filters: filterReducer(state.filters, action),
    places: placesReducer(state.places, action),
    isLoading: loadingReducer(state.isLoading, action),
  );
}