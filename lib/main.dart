import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/middleware/store_middleware.dart';
import 'package:rapidinho/ui/container/loaded_places.dart';
import 'package:rapidinho/ui/presentation/splash_page.dart';
import 'package:rapidinho/ui/tabs/places_tab.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/reducers/app_state_reducer.dart';

void main() => runApp(
  RapidinhoApp()
);

class RapidinhoApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: createStoreMiddleware(),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Rapidinho',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(InitAction()),
          builder: (context, store){
            return LoadedPlaces();
          }
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
