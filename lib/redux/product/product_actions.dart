import 'package:rapidinho/model/place.dart';

class LoadProductPlacesAction{}
class ErrorLoadingProductPlacesAction{}
class ErrorLoadingProductPlacePhotosAction{}
class ProductPlacesLoadedAction{
  final List<Place> places;
  ProductPlacesLoadedAction(this.places);
}
class UpdateProductPlaceAction {
  final String placeId;
  final Place updatedPlace;
  UpdateProductPlaceAction(this.placeId, this.updatedPlace);

  @override
  String toString() {
    return 'UpdateProductPlaceAction{placeId: $placeId, updatedPlace: $updatedPlace}';
  }
}

class LoadProductPlacePhotoAction{}
class AddPlaceAction{
  final Place place;
  AddPlaceAction(this.place);
}
