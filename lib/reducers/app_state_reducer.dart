import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/reducers/navigation_tabs_reducer.dart';

AppState appReducer(AppState state, action){
  return AppState(
    activeTab: navigationTabsReducer(state.activeTab, action),
  );
}