import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/data/data.dart';

class BottomTabSelector extends StatelessWidget {
  final Function(int) onTabChanged;
  final int currentIndex;

  BottomTabSelector({this.onTabChanged, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, viewModel){
        return BottomNavigationBar(
          currentIndex: currentIndex,
          items: navigationTabs.map((tab){
            return BottomNavigationBarItem(
              title: new Text(tab.name, style: RapidinhoTextStyle.bottomTextStyle),
              icon: new Icon(tab.icon, size: tab.name ==  'Entregas' ? 24.0 : 18.0, color: Colors.grey),
              activeIcon: Icon(tab.icon, color: Colors.red),
            );
          }).toList(),
          onTap: (index){
            viewModel.onTabChanged(index);
            onTabChanged(index);
          },
        );
      },
    );
  }
}

class _ViewModel {
  final NavigationTab activeTab;
  final Function(int) onTabChanged;

  _ViewModel({@required this.activeTab, @required this.onTabChanged});

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      activeTab: store.state.activeTab,
      onTabChanged: (index){
        store.dispatch(UpdateTabAction((NavigationTab.values[index])));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              onTabChanged == other.onTabChanged;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      onTabChanged.hashCode;

  @override
  String toString() {
    return '_ViewModel{activeTab: $activeTab, onTabChanged: $onTabChanged}';
  }
}