import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/ui/tabs/places_tab.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/repository/place_entity.dart';

class LoadedPlaces extends StatelessWidget {
  LoadedPlaces({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return PlacesTab(
          places: vm.places,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Result> places;
  final bool loading;

  _ViewModel({
    @required this.places,
    @required this.loading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      places: store.state.places,
      loading: store.state.isLoading,
    );
  }
}
