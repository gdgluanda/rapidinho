import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/tabs.dart';
import 'package:rapidinho/ui/tabs/delivery_tab.dart';
import 'package:rapidinho/ui/tabs/home_tab.dart';
import 'package:rapidinho/ui/tabs/account_tab.dart';
import 'package:rapidinho/ui/tabs/shopping_cart_tab.dart';
import 'package:rapidinho/ui/container/active_tab.dart';
import 'package:rapidinho/ui/container/bottom_tab_selector.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  Widget _buildFloatingActionButton(TabItem tab) {
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
    setState(() {
      Future.delayed(Duration(milliseconds: 500), (){
        _tabController.animateTo(_currentIndex);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppViewModel(
      builder: (context, vm){
        return WillPopScope(
          onWillPop: _exitApp,
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomTabSelector(
              onTabChanged: _changeTab,
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                HomeTab(),
                DeliveryTab(),
                Center(child: ShoppingCartTab()),
                Padding(
                  padding: EdgeInsets.only(top: kToolbarHeight),
                  child: AccountTab(),
                ),
              ],
            ),
            floatingActionButton: _buildFloatingActionButton(navigationCategories[vm.activeTab.index]),
          ),
        );
      },
    );
  }
}

