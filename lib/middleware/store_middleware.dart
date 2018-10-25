import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/repository/main_repository.dart';
import 'package:rapidinho/model/place.dart';
import 'package:rapidinho/repository/places_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() {
  PlacesRepository repository = Repository();
  final loadPlaces = _createLoadPlaces(repository);
  return [
    //TypedMiddleware<AppState, InitAction>(storeMiddleware),
    TypedMiddleware<AppState, LoadPlacesAction>(loadPlaces),
  ];
}

Middleware<AppState> _storeMiddleware(){
  return (Store<AppState> store, action, NextDispatcher next){
    next(action);
  };
}