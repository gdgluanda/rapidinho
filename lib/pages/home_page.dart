import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

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
    return navigationCategories.map((category){
      return BottomNavigationBarItem(
        title: new Text(category.name, style: bottomTextStyle),
        icon: new Icon(category.icon, color: _currentIndex == category.index ? Colors.red : Colors.grey),
      );
    }).toList();
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
