import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/model/app_state.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/actions/actions.dart';
import 'package:rapidinho/data/data.dart';

class BottomTabSelector extends StatelessWidget {

  final Function(int) onTabChanged;

  BottomTabSelector({this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel){
        return BottomNavigationBar(
          currentIndex: viewModel.activeTab.index,
          items: navigationCategories.map((category){
            return BottomNavigationBarItem(
              title: new Text(category.name, style: RapidinhoTextStyle.bottomTextStyle),
              icon: new Icon(category.icon, size: category.name ==  'Entregas' ? 24.0 : 18.0, color: viewModel.activeTab.index == category.index ? Colors.red : Colors.grey),
            );
          }).toList(),
          onTap: (index){
            viewModel.onTabSelected(index);
            onTabChanged(index);
          },
        );
      },
    );
  }
}

class _ViewModel {
  final NavigationTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({@required this.activeTab, @required this.onTabSelected});

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      activeTab: store.state.activeTab,
      onTabSelected: (index){
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
              onTabSelected == other.onTabSelected;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      onTabSelected.hashCode;
}

