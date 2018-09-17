import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: kToolbarHeight),
      child: Image.asset(
        'assets/images/featured_meal.jpg',
        fit: BoxFit.fill,
        //height: 200.0,
      ),
    );
  }
}
