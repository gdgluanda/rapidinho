import 'dart:async';
import 'package:rapidinho/redux/app_middleware.dart';
import 'package:rapidinho/redux/app_reducer.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/order/order_middleware.dart';
import 'package:rapidinho/redux/place/place_middleware.dart';
import 'package:rapidinho/network/google_places_api.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  var placesApi = GooglePlacesApi();

  return Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    //TODO review [distinct]
    //distinct: true,
    middleware: [
      AppMiddleware(),
      PlaceMiddleware(placesApi),
      OrderMiddleware(),
    ],
  );
}