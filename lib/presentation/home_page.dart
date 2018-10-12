import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rapidinho/container/active_tab.dart';
import 'package:rapidinho/container/bottom_tab_selector.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/navigation_category.dart';
import 'package:rapidinho/tabs/delivery_tab.dart';
import 'package:rapidinho/tabs/home_tab.dart';
import 'package:rapidinho/tabs/account_tab.dart';
import 'package:rapidinho/tabs/shopping_cart_tab.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class HomePageController extends StatefulWidget {
  final int filter;

  HomePageController({this.filter});

  @override
  _HomePageControllerState createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: navigationCategories.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> _exitApp() async {
    return showDialog(
        context: context,
        builder: (builderContext) {
          return AlertDialog(
            title: new Text("Aviso", style: RapidinhoTextStyle.displayText),
            content: new Text("Tem a certeza que deseja sair do aplicativo?", style: RapidinhoTextStyle.largeText),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(builderContext).pop(false),
                child: new Text("Não", style: RapidinhoTextStyle.normalText),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(builderContext).pop(true),
                child: new Text("Sim", style: RapidinhoTextStyle.normalText),
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitApp,
      child: HomePage(_tabController, widget.filter),
    );
  }
}

class HomePage extends StatelessWidget {
  final TabController _tabController;
  final int filter;
  HomePage(this._tabController, this.filter);

  Widget _buildFloatingActionButton(NavigationCategory tab) {
    if(tab.name == 'Entregas' || tab.name == 'Casa')
      return null;
    return FloatingActionButton(
        key: tab.key,
        tooltip: tab.name,
        mini: true,
        backgroundColor: Colors.red,
        child: Icon(tab.name == 'Conta' ? Icons.edit : Icons.add),
        onPressed: (){

        }
    );
  }

  _changeTab(int _currentIndex){
    Future.delayed(Duration(milliseconds: 500), (){
      _tabController.animateTo(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
        builder: (context, activeTab){
          print('Active tab: $activeTab');
          _changeTab(activeTab.index);
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomTabSelector(),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                HomeTab(activeTab.index, filter),
                DeliveryTab(activeTab.index),
                Center(child: ShoppingCartTab()),
                Padding(
                  padding: EdgeInsets.only(top: kToolbarHeight),
                  child: AccountTab(),
                ),
              ],
            ),
            floatingActionButton: _buildFloatingActionButton(navigationCategories[activeTab.index]),
          );
        }
    );
  }
}

