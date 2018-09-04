import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        alignment: Alignment.topCenter,
        child: Hero(tag: 'Rapidinho-Logo',
            child: Image.asset('assets/images/rapidinho_transparent.png', height: 150.0, width: 150.0)),
      ),
    );
  }
}
