import 'package:google_maps_webservice/places.dart';

class LoadPlacesAction{}
class RefreshPlacesAction{}
class ErrorLoadingPlacesAction{}
class ErrorLoadingPlacePhotosAction{}
class PlacesLoadedAction{
  final List<PlacesSearchResult> places;
  PlacesLoadedAction(this.places);
}
class UpdatePlaceAction {
  final String placeId;
  final PlacesSearchResult updatedPlace;
  UpdatePlaceAction(this.placeId, this.updatedPlace);

  @override
  String toString() {
    return 'UpdateProductPlaceAction{placeId: $placeId, updatedPlace: $updatedPlace}';
  }
}
class LoadProductPlacePhotosAction{}