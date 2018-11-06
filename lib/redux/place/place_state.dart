import 'package:google_maps_webservice/places.dart';
import 'package:meta/meta.dart';
import 'package:rapidinho/model/loading_status.dart';

@immutable
class PlaceState {
  final List<PlacesSearchResult> places;
  final LoadingStatus loadingStatus;

  PlaceState({this.places, this.loadingStatus});
  factory PlaceState.initial(){
    return PlaceState(
      places: [],
      loadingStatus: LoadingStatus.loading,
    );
  }

  PlaceState copyWith({
    LoadingStatus loadingStatus,
    List<PlacesSearchResult> places,
    List<Photo> placePhotos,
  }) {
    return PlaceState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      places: places ?? this.places,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PlaceState &&
              runtimeType == other.runtimeType &&
              places == other.places &&
              loadingStatus == other.loadingStatus;

  @override
  int get hashCode =>
      places.hashCode ^
      loadingStatus.hashCode;

  @override
  String toString() {
    return 'ProductState{productPlaces: $places, loadingStatus: $loadingStatus}';
  }
}