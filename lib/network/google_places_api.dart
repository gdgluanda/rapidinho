import 'dart:async';
import 'package:rapidinho/network/keys.dart';
import 'package:google_maps_webservice/places.dart';

class GooglePlacesApi {
  var _places = GoogleMapsPlaces(googleMapsApiKey);

  Future<List<PlacesSearchResult>> getNearbyPlaces() async {
    PlacesSearchResponse placesResponse = await _places.searchNearbyWithRadius(Location(-8.909302, 13.195090), 2000, type: 'restaurant');
    return placesResponse.results;
  }
}