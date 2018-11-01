import 'package:rapidinho/model/place.dart';

class PlacePhotosParser {
  static List<Photo> parse(List json){
    var photos = <Photo>[];
    json.forEach((photo){
      photos.add(
        Photo(
          photoReference: photo['photo_reference']
        )
      );
    });
    return photos;
  }
}