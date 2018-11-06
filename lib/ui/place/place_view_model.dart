import 'package:google_maps_webservice/places.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/model/loading_status.dart';
import 'package:rapidinho/redux/place/place_actions.dart';
import 'package:redux/redux.dart';

class PlaceViewModel {
  final LoadingStatus status;
  final List<PlacesSearchResult> places;
  final Function refreshPlaces;

  PlaceViewModel({this.status, this.places, this.refreshPlaces});
  static PlaceViewModel fromStore(Store<AppState> store){
    return PlaceViewModel(
      status: store.state.placeState.loadingStatus,
      places: store.state.placeState.places,
      refreshPlaces: () => store.dispatch(RefreshPlacesAction()),
    );
  }

  @override
  bool operator ==(Object other) =>
  //TODO Match Iterable Equality for places and photos list
      identical(this, other) ||
          other is PlaceViewModel &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              places == other.places;
  @override
  int get hashCode =>
      status.hashCode ^
      places.hashCode;
}