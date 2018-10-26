import 'dart:async';
import 'package:rapidinho/redux/app_state_reducer.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/product/product_middleware.dart';
import 'package:rapidinho/services/google_places_api.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  var placesApi = GooglePlacesApi();

  return Store(
    appReducer,
    initialState: AppState.init(),
    distinct: true,
    middleware: [
      ProductMiddleware(placesApi),
    ],
  );
}