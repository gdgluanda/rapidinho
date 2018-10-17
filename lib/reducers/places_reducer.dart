import 'package:redux/redux.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/repository/place_entity.dart';

final placesReducer = combineReducers<List<Result>>([
  TypedReducer<List<Result>, AddPlaceAction>(_addPlace),
  TypedReducer<List<Result>, PlacesLoadedAction>(_setLoadedPlaces),
  TypedReducer<List<Result>, PlacesNotLoadedAction>(_setNoPlaces),
]);

List<Result> _addPlace(List<Result> places, AddPlaceAction action) => List.from(places)..add(action.place);
List<Result> _setLoadedPlaces(List<Result> places, PlacesLoadedAction action) => action.places;
List<Result> _setNoPlaces(List<Result> places, PlacesNotLoadedAction action) => [];
