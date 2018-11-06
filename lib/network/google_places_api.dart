import 'dart:async';
import 'package:rapidinho/network/keys.dart';
import 'package:rapidinho/model/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rapidinho/network/place_parser.dart';

class GooglePlacesApi {

  static final Uri nearbyPlacesUrl = Uri.https('https://maps.googleapis.com', '/maps/api/place/nearbysearch/json', <String, String>{
    '?location=': '$latitude,$longitude',
    '&radius=': '$radius',
    '&type=': placeType,
    '&key=': googlePlacesApiKey,
  });
  static final double latitude = -8.885533;
  static final double longitude = 13.253325;
  static final int radius = 2000;
  static final String placeType = 'restaurant';

  Future<List<Place>> getNearbyPlaces() async {
    http.Response response = await http.get(url);
    return PlaceParser.parse(json.decode(response.body)['results']);
  }

  Future<List<Photo>> getPhotos(String placeId) async {
    List<Photo> placePhotos = [];
    http.Response response = await http.get(detailUrl+placeId+'&fields=photos&key=$googlePlacesApiKey', headers: {"Accept": "application/json"}).catchError((resp){});
    Map photos = json.decode(response.body)['result'];
    photos.forEach((f, ff){
      List photos = ff;
      photos.forEach((pho){
        Photo result = Photo(photoReference: pho['photo_reference'], height: pho["height"], width: pho["width"]);
        placePhotos.add(result);
      });
    });
    return placePhotos;
  }
}