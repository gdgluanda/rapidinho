import 'package:flutter/material.dart';
import 'package:rapidinho/home_page.dart';
import 'package:rapidinho/splash_page.dart';

void main() => runApp(
  RapidinhoApp()
);

class RapidinhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rapidinho',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
