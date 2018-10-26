import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/store.dart';
import 'package:rapidinho/ui/splash_page.dart';
import 'package:redux/redux.dart';

void main() async {
  final store = await createStore();
  runApp(RapidinhoApp(store));
}

class RapidinhoApp extends StatelessWidget {
  final Store<AppState> store;
  RapidinhoApp(this.store);

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
            return SplashPageAnimator();
          }
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
