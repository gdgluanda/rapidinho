import 'dart:async';
import 'package:rapidinho/repository/place_entity.dart';

abstract class PlacesRepository {

  Future<List<Result>> loadPlaces();

  Future savePlaces(List<Result> places);
}