import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/ui/widget/category_filter.dart';
import 'package:redux/redux.dart';

class FilterListContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel){
        return CategoryFilterList(
          filterList: viewModel.filterList,
          onFilterChanged: viewModel.onFilterChanged,
        );
      },
    );
  }
}

class _ViewModel {
  final List<FilterItem> filterList;
  final Function(FilterItem) onFilterChanged;

  _ViewModel({@required this.filterList, @required this.onFilterChanged});

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      filterList: store.state.filters,
      onFilterChanged: (filter){
        filter = filter.copyWith(isFilter: !filter.isFilter);
        store.dispatch(UpdateFilterAction(filter, filter.type));
      }
    );
  }
}
