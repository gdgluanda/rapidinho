import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/model/tab.dart';
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

  _ViewModel({this.activeTab});

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      activeTab: store.state.activeTab,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab;
  @override
  int get hashCode =>
      activeTab.hashCode;
  @override
  String toString() {
    return '_ViewModel{activeTab: $activeTab}';
  }
}
