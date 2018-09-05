import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rapidinho/rapidinho_icon.dart';
import 'package:rapidinho/rapidinho_style.dart';
import 'package:rapidinho/reveal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> revealSize;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(
      duration: const Duration(seconds: 9),
      vsync: this,
    );
    revealSize = new Tween(begin: 1.0, end: 0.6).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// The Bottom Navigation Items
  List<BottomNavigationBarItem> navigationItems() {
    return [
      BottomNavigationBarItem(
        title: new Text("Casa", style: bottomTextStyle),
        icon: new Icon(homeIcon, color: _currentIndex == 0 ? Colors.red : Colors.grey),
      ),
      BottomNavigationBarItem(
          title: new Text("Entregas", style: bottomTextStyle),
          icon: new Icon(motorCycle, size: 30.0, color: _currentIndex == 1 ? Colors.red : Colors.grey),
      ),
      BottomNavigationBarItem(
          title: new Text("Compras", style: bottomTextStyle),
          icon: new Icon(shoppingCart, color: _currentIndex == 2 ? Colors.red : Colors.grey),
      ),
      BottomNavigationBarItem(
          title: new Text('Conta', style: bottomTextStyle),
          icon: new Icon(account, color: _currentIndex == 3 ? Colors.red : Colors.grey),
      )
    ];
  }

  // selected index
  int _currentIndex = 0;

  Future<bool> _exitApp() async{
    return false;
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
            });
          },
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: 100.0,
              color: Colors.red,
            ),
            Align(
              alignment: Alignment.center.add(Alignment(0.0, -1.0)),
              child: Hero(tag: 'Rapidinho-Logo',
                  child: Image.asset('assets/images/rapidinho_transparent.png', height: 150.0, width: 150.0)),
            ),
          ],
        ),
      ),
    );
  }
}
