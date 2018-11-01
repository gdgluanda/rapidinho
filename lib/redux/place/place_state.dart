import 'package:meta/meta.dart';
import 'package:rapidinho/model/loading_status.dart';
import 'package:rapidinho/model/place.dart';

@immutable
class PlaceState {
  final List<Place> places;
  final List<Photo> placesPhotos;
  final LoadingStatus loadingStatus;

  PlaceState({this.places, this.placesPhotos, this.loadingStatus});
  factory PlaceState.initial(){
    return PlaceState(
      places: [],
      placesPhotos: [],
      loadingStatus: LoadingStatus.loading,
    );
  }

  PlaceState copyWith({
    LoadingStatus loadingStatus,
    List<Place> places,
    List<Photo> placePhotos,
  }) {
    return PlaceState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      places: places ?? this.places,
      placesPhotos: placePhotos ?? this.placesPhotos,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PlaceState &&
              runtimeType == other.runtimeType &&
              places == other.places &&
              placesPhotos == other.placesPhotos &&
              loadingStatus == other.loadingStatus;

  @override
  int get hashCode =>
      places.hashCode ^
      placesPhotos.hashCode ^
      loadingStatus.hashCode;

  @override
  String toString() {
    return 'ProductState{productPlaces: $places, productPlacePhotos: $placesPhotos, loadingStatus: $loadingStatus}';
  }
}