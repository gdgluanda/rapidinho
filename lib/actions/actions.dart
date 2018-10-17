import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:rapidinho/repository/place_entity.dart';

class InitAction {}
class PlacesNotLoadedAction{}
class LoadPlacesAction{}
class PlacesLoadedAction{
  final List<Result> places;

  PlacesLoadedAction(this.places);

  @override
  String toString() {
    return 'PlacesLoadedAction{places: $places}';
  }
}
class AddPlaceAction{
  final Result place;

  AddPlaceAction(this.place);

  @override
  String toString() {
    return 'AddPlaceAction{place: $place}';
  }
}

class UpdateTabAction {
  final NavigationTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}

class UpdateFilterAction {
  final FilterItem filterItem;
  final FilterType type;

  UpdateFilterAction(this.filterItem, this.type);

  @override
  String toString() {
    return 'UpdateFilterAction{filterItem: $filterItem, type: $type}';
  }
}