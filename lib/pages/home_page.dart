import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/tabs/delivery_tab.dart';
import 'package:rapidinho/tabs/home_tab.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

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

  /// The Bottom Navigation Items
  List<BottomNavigationBarItem> navigationItems() {
    return navigationCategories.map((category){
      return BottomNavigationBarItem(
        title: new Text(category.name, style: RapidinhoTextStyle.bottomTextStyle),
        icon: new Icon(category.icon, size: category.name ==  'Entregas' ? 30.0 : 24.0, color: _currentIndex == category.index ? Colors.red : Colors.grey),
      );
    }).toList();
  }

  // selected index
  int _currentIndex = 0;

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
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _currentIndex,
          items: navigationItems(),
          onTap: (int index){
            setState(() {
              _currentIndex = index;
              _tabController.animateTo(_currentIndex);
            });
          },
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: navigationCategories.map((category){
            if(category.name == 'Entregas'){
              return DeliveryTab();
            } else if(category.name == 'Casa'){
              return HomeTab();
            } else {
              return Center(child: Text(category.name, style: RapidinhoTextStyle.displayText));
            }
          }).toList(),
        ),
      ),
    );
  }
}
