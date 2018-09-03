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
          ]
      ),
    );
  }
}
