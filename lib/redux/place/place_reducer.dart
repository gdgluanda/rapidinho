import 'package:rapidinho/model/loading_status.dart';
import 'package:rapidinho/redux/place/place_state.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/redux/place/place_actions.dart';

final placeReducer = combineReducers<PlaceState>([
  TypedReducer<PlaceState, LoadPlacesAction>(_loadPlaces),
  TypedReducer<PlaceState, PlacesLoadedAction>(_setPlacesLoaded),
  TypedReducer<PlaceState, ErrorLoadingPlacesAction>(_errorLoadingPlaces),
]);

PlaceState _loadPlaces(PlaceState state, LoadPlacesAction action) =>
    state.copyWith(loadingStatus: LoadingStatus.loading);

PlaceState _setPlacesLoaded(PlaceState state, PlacesLoadedAction action) =>
    state.copyWith(
      loadingStatus: LoadingStatus.success,
      places: action.places,
    );

PlaceState _errorLoadingPlaces(PlaceState state, ErrorLoadingPlacesAction action) =>
    state.copyWith(loadingStatus: LoadingStatus.error);