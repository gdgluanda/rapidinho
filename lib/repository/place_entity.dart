import 'dart:convert';

Place placeFromJson(String str) {
  final jsonData = json.decode(str);
  return Place.fromJson(jsonData);
}

String placeToJson(Place data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Place {
  DebugLog debugLog;
  List<dynamic> htmlAttributions;
  Result result;
  String status;

  Place({
    this.debugLog,
    this.htmlAttributions,
    this.result,
    this.status,
  });

  factory Place.fromJson(Map<String, dynamic> json) => new Place(
    debugLog: DebugLog.fromJson(json["debug_log"]),
    htmlAttributions: new List<dynamic>.from(json["html_attributions"].map((x) => x)),
    result: Result.fromJson(json["result"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "debug_log": debugLog.toJson(),
    "html_attributions": new List<dynamic>.from(htmlAttributions.map((x) => x)),
    "result": result.toJson(),
    "status": status,
  };
}

class DebugLog {
  List<dynamic> line;

  DebugLog({
    this.line,
  });

  factory DebugLog.fromJson(Map<String, dynamic> json) => new DebugLog(
    line: new List<dynamic>.from(json["line"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "line": new List<dynamic>.from(line.map((x) => x)),
  };
}

class Result {
  List<AddressComponent> addressComponents;
  String adrAddress;
  String formattedAddress;
  String formattedPhoneNumber;
  Geometry geometry;
  String icon;
  String id;
  String internationalPhoneNumber;
  String name;
  OpeningHours openingHours;
  List<Photo> photos;
  String placeId;
  double rating;
  String reference;
  List<Review> reviews;
  String scope;
  List<String> types;
  String url;
  int utcOffset;
  String vicinity;
  String website;

  Result({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.formattedPhoneNumber,
    this.geometry,
    this.icon,
    this.id,
    this.internationalPhoneNumber,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.rating,
    this.reference,
    this.reviews,
    this.scope,
    this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
    this.website,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    addressComponents: new List<AddressComponent>.from(json["address_components"].map((x) => AddressComponent.fromJson(x))),
    adrAddress: json["adr_address"],
    formattedAddress: json["formatted_address"],
    formattedPhoneNumber: json["formatted_phone_number"],
    geometry: Geometry.fromJson(json["geometry"]),
    icon: json["icon"],
    id: json["id"],
    internationalPhoneNumber: json["international_phone_number"],
    name: json["name"],
    openingHours: OpeningHours.fromJson(json["opening_hours"]),
    photos: new List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    placeId: json["place_id"],
    rating: json["rating"].toDouble(),
    reference: json["reference"],
    reviews: new List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    scope: json["scope"],
    types: new List<String>.from(json["types"].map((x) => x)),
    url: json["url"],
    utcOffset: json["utc_offset"],
    vicinity: json["vicinity"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "address_components": new List<dynamic>.from(addressComponents.map((x) => x.toJson())),
    "adr_address": adrAddress,
    "formatted_address": formattedAddress,
    "formatted_phone_number": formattedPhoneNumber,
    "geometry": geometry.toJson(),
    "icon": icon,
    "id": id,
    "international_phone_number": internationalPhoneNumber,
    "name": name,
    "opening_hours": openingHours.toJson(),
    "photos": new List<dynamic>.from(photos.map((x) => x.toJson())),
    "place_id": placeId,
    "rating": rating,
    "reference": reference,
    "reviews": new List<dynamic>.from(reviews.map((x) => x.toJson())),
    "scope": scope,
    "types": new List<dynamic>.from(types.map((x) => x)),
    "url": url,
    "utc_offset": utcOffset,
    "vicinity": vicinity,
    "website": website,
  };
}

class AddressComponent {
  String longName;
  String shortName;
  List<String> types;

  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  factory AddressComponent.fromJson(Map<String, dynamic> json) => new AddressComponent(
    longName: json["long_name"],
    shortName: json["short_name"],
    types: new List<String>.from(json["types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "long_name": longName,
    "short_name": shortName,
    "types": new List<dynamic>.from(types.map((x) => x)),
  };
}

class Geometry {
  Location location;

  Geometry({
    this.location,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => new Geometry(
    location: Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
  };
}

class Location {
  double lat;
  double lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => new Location(
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class OpeningHours {
  bool openNow;
  List<Period> periods;
  List<String> weekdayText;

  OpeningHours({
    this.openNow,
    this.periods,
    this.weekdayText,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) => new OpeningHours(
    openNow: json["open_now"],
    periods: new List<Period>.from(json["periods"].map((x) => Period.fromJson(x))),
    weekdayText: new List<String>.from(json["weekday_text"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "open_now": openNow,
    "periods": new List<dynamic>.from(periods.map((x) => x.toJson())),
    "weekday_text": new List<dynamic>.from(weekdayText.map((x) => x)),
  };
}

class Period {
  Close close;
  Close open;

  Period({
    this.close,
    this.open,
  });

  factory Period.fromJson(Map<String, dynamic> json) => new Period(
    close: Close.fromJson(json["close"]),
    open: Close.fromJson(json["open"]),
  );

  Map<String, dynamic> toJson() => {
    "close": close.toJson(),
    "open": open.toJson(),
  };
}

class Close {
  int day;
  String time;

  Close({
    this.day,
    this.time,
  });

  factory Close.fromJson(Map<String, dynamic> json) => new Close(
    day: json["day"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "time": time,
  };
}

class Photo {
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => new Photo(
    height: json["height"],
    htmlAttributions: new List<String>.from(json["html_attributions"].map((x) => x)),
    photoReference: json["photo_reference"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "html_attributions": new List<dynamic>.from(htmlAttributions.map((x) => x)),
    "photo_reference": photoReference,
    "width": width,
  };
}

class Review {
  List<Aspect> aspects;
  String authorName;
  String authorUrl;
  String language;
  int rating;
  String text;
  int time;

  Review({
    this.aspects,
    this.authorName,
    this.authorUrl,
    this.language,
    this.rating,
    this.text,
    this.time,
  });

  factory Review.fromJson(Map<String, dynamic> json) => new Review(
    aspects: new List<Aspect>.from(json["aspects"].map((x) => Aspect.fromJson(x))),
    authorName: json["author_name"],
    authorUrl: json["author_url"],
    language: json["language"],
    rating: json["rating"],
    text: json["text"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "aspects": new List<dynamic>.from(aspects.map((x) => x.toJson())),
    "author_name": authorName,
    "author_url": authorUrl,
    "language": language,
    "rating": rating,
    "text": text,
    "time": time,
  };
}

class Aspect {
  int rating;
  String type;

  Aspect({
    this.rating,
    this.type,
  });

  factory Aspect.fromJson(Map<String, dynamic> json) => new Aspect(
    rating: json["rating"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "type": type,
  };
}
