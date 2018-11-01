import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/place/place_actions.dart';
import 'package:rapidinho/model/place.dart';
import 'package:rapidinho/network/google_places_api.dart';
import 'package:redux/redux.dart';

class PlaceMiddleware extends MiddlewareClass<AppState> {

  final GooglePlacesApi placesApi;
  PlaceMiddleware(this.placesApi);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if(action is InitAction || action is RefreshPlacesAction){
      _loadPlaces(next);
    } else if(action is PlacesLoadedAction){
      for(var place in store.state.placeState.places){
        _loadPlacePhotos(next, place);
      }
    }
  }

  _loadPlaces(NextDispatcher next) async {
    next(LoadPlacesAction);
    try{
      var places = await placesApi.getNearbyPlaces();
      next(PlacesLoadedAction(places));
    } catch(e){
      next(ErrorLoadingPlacesAction());
    }
  }

  _loadPlacePhotos(NextDispatcher next, Place place) async {
    next(LoadProductPlacePhotosAction);
    try{
      var placePhotos = await placesApi.getPhotos(place.placeId);
      next(UpdatePlaceAction(place.placeId, place.copyWith(photos: placePhotos)));
    } catch(e){
      next(ErrorLoadingPlacePhotosAction());
    }
  }
}