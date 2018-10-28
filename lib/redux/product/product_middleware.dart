import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/product/product_actions.dart';
import 'package:rapidinho/model/place.dart';
import 'package:rapidinho/network/google_places_api.dart';
import 'package:redux/redux.dart';

class ProductMiddleware extends MiddlewareClass<AppState> {

  final GooglePlacesApi placesApi;
  ProductMiddleware(this.placesApi);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if(action is InitAction || action is RefreshProductsAction){
      _loadProductPlaces(next);
    } else if(action is ProductPlacesLoadedAction){
      for(var place in store.state.productState.productPlaces){
        _loadProductPlacePhotos(next, place);
      }
    }
  }

  _loadProductPlaces(NextDispatcher next) async {
    next(LoadProductPlacesAction);
    try{
      var places = await placesApi.getNearbyPlaces();
      next(ProductPlacesLoadedAction(places));
    } catch(e){
      next(ErrorLoadingProductPlacesAction());
    }
  }

  _loadProductPlacePhotos(NextDispatcher next, Place place) async {
    next(LoadProductPlacePhotosAction);
    try{
      var placePhotos = await placesApi.getPhotos(place.placeId);
      next(UpdateProductPlaceAction(place.placeId, place.copyWith(photos: placePhotos)));
    } catch(e){
      next(ErrorLoadingProductPlacePhotosAction());
    }
  }
}