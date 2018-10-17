import 'package:redux/redux.dart';
import 'package:rapidinho/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, PlacesLoadedAction>(_setLoaded),
  TypedReducer<bool, PlacesNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action){
  return false;
}