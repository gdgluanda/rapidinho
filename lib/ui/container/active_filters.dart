import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/selectors/selectors.dart';
import 'package:redux/redux.dart';

class ActiveFilters extends StatelessWidget {
  final ViewModelBuilder<_ViewModel> builder;

  ActiveFilters({Key key, @required this.builder}) : super(key: key);

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
  final List<FilterItem> activeFilters;

  _ViewModel({@required this.activeFilters});

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      activeFilters: activeFiltersSelector(store.state.filters),
    );
  }
}
