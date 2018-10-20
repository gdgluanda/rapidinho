import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/ui/tabs/places_tab.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/repository/place_entity.dart';

class LoadedPlaces extends StatelessWidget {

  final ViewModelBuilder<_ViewModel> builder;
  LoadedPlaces({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: builder,
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              places == other.places &&
              loading == other.loading;

  @override
  int get hashCode =>
      places.hashCode ^
      loading.hashCode;

  @override
  String toString() {
    return '_ViewModel{places: $places, loading: $loading}';
  }
}
