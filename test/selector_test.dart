import 'package:flutter_test/flutter_test.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/redux/app_reducer.dart';
import 'package:rapidinho/redux/selectors.dart';

main(){
  group('Selector', (){
    test('Sould get the number of active filters', (){
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );
      //expect(numActiveFiltersSelector(store.state), 2);
    });
  });
}