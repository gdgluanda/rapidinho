import 'package:flutter_test/flutter_test.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/selectors.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/redux/app_reducer.dart';

main(){
  group('Test state reducer', (){
    test('should get the filter list', (){
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      expect(store.state.filters.length, 6);
    });

    test('should get the list of active filters after one is updated', (){
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );
      final filter = store.state.filters[1].copyWith(isFilter: true);
      store.dispatch(UpdateFilterAction(filter, filter.type));
      expect(numActiveFiltersSelector(store.state.filters), 3);
    });

    test('Should change the active tab', (){
      final store = Store<AppState>(
        appReducer,
        distinct: true,
        initialState: AppState.init(),
      );

      store.dispatch(UpdateTabAction(NavigationTab.Cart));
      expect(store.state.activeTab.index, 2);
    });
  });
}