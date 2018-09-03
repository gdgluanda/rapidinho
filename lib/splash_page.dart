import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Stack(
          children: [
            Center(
                child: Image.asset('assets/images/rapidinho_transparent.png')),
            Center(child: Text('Entregas na hora', style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.white,
                fontSize: 17.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w600))),
          ]
      ),
    );
  }
}
