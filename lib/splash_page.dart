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
                    child: Image.asset('assets/images/rapidinho_transparent.png'))),
            Align(
                alignment: Alignment.center.add(Alignment(0.5, 0.07)),
                child: Text('Entregas na hora', style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w500))),
          ]
      ),
    );
  }
}
