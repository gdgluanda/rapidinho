import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapidinho/ui/animation/category_filter_expand_animation.dart';
import 'package:rapidinho/ui/animation/splash_animation.dart';
import 'package:rapidinho/ui/widget/category_filter.dart';

class SplashPage extends StatelessWidget {

  SplashPage(
    this.callback, {
    @required AnimationController controller,
    @required AnimationController expandController,
    @required screenHeight,
  }) : animation = new SplashPageEnterAnimation(controller, screenHeight), expandAnimation = CategoryFilterExpandExpandAnimation(expandController);

  final SplashPageEnterAnimation animation;
  final CategoryFilterExpandExpandAnimation expandAnimation;
  final VoidCallback callback;

  Widget _buildSplashAnimation(BuildContext context, Widget child){
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1.0, 3.0),
                    blurRadius: 5.0,
                  ),
                ],
            ),
            child: Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  height: animation.heightSize.value,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                        child: Icon(Icons.filter_list, color: Colors.white.withOpacity(animation.actionButtonOpacity.value)),
                      ),
                      onTap: callback,
                    ),
                  ),
                ),
                CategoryFilter(
                  expandAnimation: expandAnimation.containerHeight,
                ),
              ],
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

class _SplashPageAnimator extends State<SplashPageAnimator> with TickerProviderStateMixin {

  AnimationController _controller;
  AnimationController _expandController;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );
    _expandController = AnimationController(
      duration: Duration(milliseconds: 100),
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
      (){
        _expandController.isCompleted ? _expandController.reverse() : _expandController.forward();
      },
      expandController: _expandController,
      controller: _controller,
      screenHeight: screenHeight,
    );
  }
}