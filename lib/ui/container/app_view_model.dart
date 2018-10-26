import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/model/tabs.dart';
import 'package:rapidinho/redux/common_actions.dart';
import 'package:redux/redux.dart';

class AppViewModel extends StatelessWidget {
  final ViewModelBuilder<_ViewModel> builder;

  AppViewModel({Key key, @required this.builder}) : super(key: key);

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
  final NavigationTab activeTab;
  final List<FilterItem> filterList;
  final Function(FilterItem) onFilterChanged;

  _ViewModel({this.activeTab, this.filterList, this.onFilterChanged});

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      activeTab: store.state.activeTab,
      filterList: store.state.filters,
        onFilterChanged: (filter){
          filter = filter.copyWith(isFilter: !filter.isFilter);
          store.dispatch(UpdateFilterAction(filter, filter.type));
      }
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              filterList == other.filterList &&
              onFilterChanged == other.onFilterChanged;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      filterList.hashCode ^
      onFilterChanged.hashCode;

  @override
  String toString() {
    return '_ViewModel{activeTab: $activeTab, filterList: $filterList, onFilterChanged: $onFilterChanged}';
  }
}
