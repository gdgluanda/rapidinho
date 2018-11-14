import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/place/place_actions.dart';
import 'package:rapidinho/network/google_places_api.dart';
import 'package:redux/redux.dart';

class PlaceMiddleware extends MiddlewareClass<AppState> {

  final GooglePlacesApi placesApi;
  PlaceMiddleware(this.placesApi);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    if(action is LoadPlacesAction || action is RefreshPlacesAction){
      _loadPlaces(next);
    }
  }

  _loadPlaces(NextDispatcher next) async {
    try{
      var places = await placesApi.getNearbyPlaces();
      next(PlacesLoadedAction(places));
    } catch(e){
      next(ErrorLoadingPlacesAction());
    }
  }
}