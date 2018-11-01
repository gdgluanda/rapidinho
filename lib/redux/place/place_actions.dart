import 'package:rapidinho/model/place.dart';

class LoadPlacesAction{}
class RefreshPlacesAction{}
class ErrorLoadingPlacesAction{}
class ErrorLoadingPlacePhotosAction{}
class PlacesLoadedAction{
  final List<Place> places;
  PlacesLoadedAction(this.places);
}
class UpdatePlaceAction {
  final String placeId;
  final Place updatedPlace;
  UpdatePlaceAction(this.placeId, this.updatedPlace);

  @override
  String toString() {
    return 'UpdateProductPlaceAction{placeId: $placeId, updatedPlace: $updatedPlace}';
  }
}

class LoadProductPlacePhotosAction{}
class AddPlaceAction{
  final Place place;
  AddPlaceAction(this.place);
}
