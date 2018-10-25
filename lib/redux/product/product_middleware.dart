import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/redux/product/product_actions.dart';
import 'package:rapidinho/model/place.dart';
import 'package:rapidinho/services/google_places_api.dart';
import 'package:redux/redux.dart';

class ProductMiddleware extends MiddlewareClass<AppState> {

  final GooglePlacesApi placesApi;
  ProductMiddleware(this.placesApi);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    switch(action){
      case InitAction:
        _loadProductPlaces(next);
        break;
      case ProductPlacesLoadedAction:
        for(var place in store.state.productState.productPlaces){
          _loadProductPlacePhotos(next, place);
        }
        break;
    }
  }

  _loadProductPlaces(NextDispatcher next) async {
    next(LoadProductPlacesAction);
    try{
      var places = await placesApi.getPlaces();
      next(ProductPlacesLoadedAction(places));
    } catch(e){
      next(ErrorLoadingProductPlacesAction());
    }
  }

  _loadProductPlacePhotos(NextDispatcher next, Result place) async {
    next(LoadProductPlacePhotoAction);
    try{
      var placePhotos = await placesApi.getPhotos(place.placeId);
      next(UpdateProductPlaceAction(place.placeId, place.copyWith(photos: placePhotos)));
    } catch(e){
      next(ErrorLoadingProductPlacePhotosAction());
    }
  }
}