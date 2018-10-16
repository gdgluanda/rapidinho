import 'package:flutter_test/flutter_test.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/selectors/selectors.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/reducers/app_state_reducer.dart';

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
  });
}