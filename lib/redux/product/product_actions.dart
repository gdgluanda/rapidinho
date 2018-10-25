import 'package:rapidinho/model/place.dart';

class LoadProductPlacesAction{}
class ErrorLoadingProductPlacesAction{}
class ErrorLoadingProductPlacePhotosAction{}
class ProductPlacesLoadedAction{
  final List<Result> places;
  ProductPlacesLoadedAction(this.places);
}
class UpdateProductPlaceAction {
  final String placeId;
  final Result updatedPlace;
  UpdateProductPlaceAction(this.placeId, this.updatedPlace);

  @override
  String toString() {
    return 'UpdateProductPlaceAction{placeId: $placeId, updatedPlace: $updatedPlace}';
  }
}

class LoadProductPlacePhotoAction{}
class AddPlaceAction{
  final Result place;
  AddPlaceAction(this.place);
}
