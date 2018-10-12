import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() {
  final storeMiddleware = _storeMiddleware();
  return [
    TypedMiddleware<AppState, InitAction>(storeMiddleware),
  ];
}

Middleware<AppState> _storeMiddleware(){
  return (Store<AppState> store, action, NextDispatcher next){
    next(action);
  };
}
