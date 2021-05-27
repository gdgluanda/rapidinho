import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/cart.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/ui/tabs/delivery_tab.dart';
import 'package:rapidinho/ui/tabs/home_tab.dart';
import 'package:rapidinho/ui/tabs/account_tab.dart';
import 'package:rapidinho/ui/tabs/shopping_cart_tab.dart';
import 'package:rapidinho/ui/container/bottom_tab_selector.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class HomePage extends StatefulWidget {
  int index;
  HomePage({this.index});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        vsync: this, length: navigationTabs.length, initialIndex: widget.index);
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
            content: new Text("Tem a certeza que deseja sair do aplicativo?",
                style: RapidinhoTextStyle.largeText),
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
        });
  }

  Widget _buildFloatingActionButton(TabItem tab) {
    if (tab.name == 'Entregas' || tab.name == 'Casa') return null;
    return FloatingActionButton(
        key: tab.key,
        tooltip: tab.name,
        mini: true,
        backgroundColor: Colors.red,
        child: Icon(tab.name == 'Conta' ? Icons.edit : Icons.add),
        onPressed: () {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitApp,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              'assets/images/rapidinho_transparent_white.png',
              fit: BoxFit.fill,
              width: 120,
              height: 40,
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomTabSelector(
            onTabChanged: (_currentIndex) {
              setState(() {
                widget.index = _currentIndex;
                Future.delayed(Duration(milliseconds: 500), () {
                  _tabController.animateTo(_currentIndex);
                });
              });
            },
            currentIndex: widget.index,
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              HomeTab(),
              DeliveryTab(),
              ShoppingCartTab(
                cart: cart,
              ),
              AccountTab(),
            ],
          ),
          //floatingActionButton: _buildFloatingActionButton(navigationTabs[vm.activeTab.index]),
        ),
      ),
    );
  }
}
