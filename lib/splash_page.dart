import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapidinho/home_page.dart';
import 'package:rapidinho/reveal.dart';
import 'package:rapidinho/splash_animation.dart';

class SplashPage extends StatelessWidget {

  SplashPage({
    @required AnimationController controller,
  }) : animation = new SplashPageEnterAnimation(controller);

  final SplashPageEnterAnimation animation;

  Widget _buildSplashAnimation(BuildContext context, Widget child){
    return Stack(
        children: [
          Reveal(
            revealPercent: animation.revealSize.value,
            child: Container(
              color: Colors.white,
            ),
          ),
          Container(
            height: 100.0,
            color: Colors.red,
          ),
          Align(
            alignment: Alignment.center.add(Alignment(0.0, animation.logoAlignment.value)),
              child: Hero(
                  tag: 'Rapidinho-Logo',
                  child: Image.asset(
                    'assets/images/rapidinho_transparent.png',
                    width: animation.logoSize.value, height: animation.logoSize.value))),
          Align(
              alignment: Alignment.center.add(Alignment(0.45, 0.05)),
              child: Text('Entregas na hora', style: TextStyle(
                  fontFamily: 'Rajdhani',
                  color: Colors.white.withOpacity(animation.sloganOpacity.value),
                  fontSize: 15.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500))),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: new AnimatedBuilder(
        animation: animation.controller,
        builder: _buildSplashAnimation,
      ),
    );
  }
}

class SplashPageAnimator extends StatefulWidget {
  @override
  _SplashPageAnimator createState() => new _SplashPageAnimator();
}

class _SplashPageAnimator extends State<SplashPageAnimator> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.forward();
    Future.delayed(
        Duration(milliseconds: 5050)).then((_) =>
        Navigator.of(context).push(MaterialPageRoute<Null>(
            builder: (context){
              return HomePage();
            }
        ))
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SplashPage(
      controller: _controller,
    );
  }
}