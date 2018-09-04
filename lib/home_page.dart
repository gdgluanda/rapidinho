import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// The Bottom Navigation Items
  List<BottomNavigationBarItem> navigationItems() {
    return [
      BottomNavigationBarItem(
        title: new Text("Home"),
        icon: new Icon(Icons.home),
        backgroundColor: Colors.redAccent,

      ),
      BottomNavigationBarItem(
          title: new Text("Orders"),
          icon: new Icon(Icons.reorder)
      ),
      BottomNavigationBarItem(
          title: new Text("Cart"),
          icon: new Icon(Icons.shopping_cart)
      ),
      BottomNavigationBarItem(
          title: new Text('Account'),
          icon: new Icon(Icons.account_circle),
      )
    ];
  }

  // selected index
  int _currentIndex = 0;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        items: navigationItems(),
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });

        },
      ),
    );
  }
}
