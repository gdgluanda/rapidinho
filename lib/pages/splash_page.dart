import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapidinho/ui/animation/splash_animation.dart';

class SplashPage extends StatelessWidget {

  SplashPage({
    @required AnimationController controller,
    @required screenHeight,
  }) : animation = new SplashPageEnterAnimation(controller, screenHeight);

  final SplashPageEnterAnimation animation;

  Widget _buildSplashAnimation(BuildContext context, Widget child){
    return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: animation.heightSize.value,
            decoration: BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0,
                ),
              ]
            ),
          ),
          Align(
            alignment: Alignment.center.add(Alignment(0.0, animation.logoAlignment.value)),
              child: Image.asset(
                'assets/images/rapidinho_transparent.png',
                width: animation.logoSize.value, height: animation.logoSize.value)),
          Align(
              alignment: Alignment.center.add(Alignment(0.45, 0.05)),
              child: Material(
                color: Colors.transparent,
                child: Text('Entregas na hora', style: TextStyle(
                    fontFamily: 'Rajdhani',
                    color: Colors.white.withOpacity(animation.sloganOpacity.value),
                    fontSize: 15.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500)),
              )),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: _buildSplashAnimation,
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
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    Future.delayed(
        Duration(seconds: 3)).then((_) => _controller.forward()
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SplashPage(
      controller: _controller,
      screenHeight: screenHeight,
    );
  }
}