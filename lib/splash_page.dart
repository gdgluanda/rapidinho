import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rapidinho/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(milliseconds: 5000)).then((_) =>
        Navigator.of(context).push(MaterialPageRoute<Null>(
            builder: (context){
              return HomePage();
            }
        ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
          children: [
            Center(
                child: Hero(
                  tag: 'Rapidinho-Logo',
                    child: Image.asset('assets/images/rapidinho_transparent.png', width: 300.0, height: 300.0,))),
            Align(
                alignment: Alignment.center.add(Alignment(0.45, 0.05)),
                child: Text('Entregas na hora', style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.white,
                fontSize: 15.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500))),
          ]
      ),
    );
  }
}
