import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/repository/main_repository.dart';
import 'package:rapidinho/repository/place_entity.dart';
import 'package:rapidinho/repository/places_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() {
  Repository repository = Repository();
  final storeMiddleware = _storeMiddleware();
  final loadPlaces = _createLoadPlaces(repository);
  return [
    TypedMiddleware<AppState, InitAction>(storeMiddleware),
    TypedMiddleware<AppState, LoadPlacesAction>(loadPlaces),
  ];
}

Middleware<AppState> _storeMiddleware(){
  return (Store<AppState> store, action, NextDispatcher next){
    next(action);
  };
}

Middleware<AppState> _createLoadPlaces(PlacesRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPlaces().then((places) {
        store.dispatch(
          PlacesLoadedAction(
            places.map((Result place) => place).toList(),
          ),
        );
      },
    ).catchError((_) => store.dispatch(PlacesNotLoadedAction()));
    next(action);
  };
}