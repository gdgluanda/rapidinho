import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/reducers/navigation_tabs_reducer.dart';
import 'package:rapidinho/reducers/filter_reducer.dart';

AppState appReducer(AppState state, action){
  return AppState(
    activeTab: navigationTabsReducer(state.activeTab, action),
    filterType: filterReducer(state.filterType, action),
  );
}