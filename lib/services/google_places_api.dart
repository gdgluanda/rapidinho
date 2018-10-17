import 'dart:async';
import 'package:rapidinho/keys/google_places_api_key.dart';
import 'package:rapidinho/repository/place_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rapidinho/utils/http_utils.dart';

class GooglePlacesApi {
  final Duration delay;
  const GooglePlacesApi([this.delay = const Duration(milliseconds: 3000)]);

  Future<List<Result>> fetchPlaces() async {
    return Future.delayed(
      delay,
      (){
        //var client = new http.Client();
        //client.send(new http.Request('get', Uri.parse(url)));
        //var response = http.get(url, headers: {"Accept": "application/json"});
        //List data = json.decode(response.body)["results"];
        //var places = <Result>[];
        //return;
        var uri = Uri.parse(url);
        var response = getRequest(uri);
        List data = json.decode(response.toString())["results"];
        var results = <Result>[];
        data.forEach((result) => results.add(Result.fromJson(result)));
        return results;
      }
    );
  }
}