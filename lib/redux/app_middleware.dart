import 'package:rapidinho/database/database.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/redux/place/place_actions.dart';
import 'package:redux/redux.dart';

class AppMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if(action is InitAction){
      _initDatabase(store, next);
    }
  }

  _initDatabase(Store<AppState> store, NextDispatcher next) async {
   try {
    var database = await RapidinhoDatabase().initDB();
    next(DatabaseCreatedAction(database));
    next(LoadPlacesAction());
   } catch(e){
     next(ErrorCreatingDatabase());
     print(e);
   }
  }
}