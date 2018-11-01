import 'package:rapidinho/model/place.dart';
import 'package:rapidinho/network/place_photos_parser.dart';

class PlaceParser {
  static List<Place> parse(List json){
    var places = <Place>[];
    json.forEach((place){
      places.add(
        Place(
          placeId: place['place_id'],
          name: place['name'],
          rating: place['rating'].toDouble(),
          //photos: PlacePhotosParser.parse(place['photos']),
        ),
      );
    });
    return places;
  }
}