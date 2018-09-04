import 'package:flutter/material.dart';
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
        title: new Text("Home"),
        icon: new Icon(Icons.home),
        backgroundColor: Colors.deepPurple,
      ),
      BottomNavigationBarItem(
          title: new Text("Orders"),
          icon: new Icon(Icons.reorder),
          backgroundColor: Colors.blue
      ),
      BottomNavigationBarItem(
          title: new Text("Cart"),
          icon: new Icon(Icons.shopping_cart),
          backgroundColor: Colors.amber
      ),
      BottomNavigationBarItem(
          title: new Text('Account'),
          icon: new Icon(Icons.account_circle),
          backgroundColor: Colors.teal
      )
    ];
  }

  // selected index
  int _currentIndex = 0;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
