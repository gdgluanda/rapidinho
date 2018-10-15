import 'package:flutter_test/flutter_test.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/reducers/app_state_reducer.dart';

main(){
  group('Test state reducer', (){
    test('should get the filtered item', (){
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(filterType: FilterType.Allowed),
      );
      store.dispatch(UpdateFilterAction(FilterType.Recommended));
      expect(store.state.filterType, FilterType.Recommended);
    });
  });
}