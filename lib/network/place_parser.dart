import 'package:rapidinho/model/place.dart';

class PlaceParser {
  static List<Place> parse(List json){
    var places = <Place>[];
    json.forEach((place){
      places.add(
        Place(
          placeId: place['place_id'],
          name: place['name'],
          rating: place['rating'].toDouble(),
          adrAddress: place["adr_address"],
        )
      );
    });
    return places;
  }
}