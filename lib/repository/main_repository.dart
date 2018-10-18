import 'dart:async';
import 'package:rapidinho/repository/place_entity.dart';
import 'package:rapidinho/repository/places_repository.dart';
import 'package:rapidinho/services/google_places_api.dart';

class Repository implements PlacesRepository {
  final GooglePlacesApi webClient;

  Repository({
    this.webClient = const GooglePlacesApi(),
  });

  @override
  Future<List<Result>> loadPlaces() async {
    try{
      return await webClient.getPlaces();
    } catch(e){
      return [];
    }
  }
}