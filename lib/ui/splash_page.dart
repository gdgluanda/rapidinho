import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/ui/animation/splash_animation.dart';
import 'package:rapidinho/ui/container/app_view_model.dart';
import 'package:rapidinho/ui/home_page.dart';
import 'package:rapidinho/ui/widget/category_filter.dart';

class SplashPage extends StatelessWidget {

  SplashPage({
    @required AnimationController controller,
    @required screenHeight,
    this.callback,
    this.height,
  }) : animation = new SplashPageEnterAnimation(controller, screenHeight);

  final SplashPageEnterAnimation animation;
  final VoidCallback callback;
  final double height;

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
            child: AppViewModel(
              builder: (context, vm){
                return Wrap(
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
                          ),
                          onTap: (){},
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      duration: Duration(milliseconds: 100),
                      height: vm.activeTab == NavigationTab.Home ? height : 0.0,
                      //child: CategoryFilterList(),
                    ),
                  ],
                );
              },
            ),
          ),
          Align(
              alignment: Alignment.center.add(Alignment(0.0, animation.logoAlignment.value)),
              child: Image.asset(
                  'assets/images/rapidinho_transparent_white.png',
                  width: animation.logoWidth.value,
                  height: animation.logoHeight.value
              ),
          ),
          Align(
              alignment: Alignment.center.add(Alignment(0.35, 0.11)),
              child: IgnorePointer(
                ignoring: true,
                child: Material(
                  color: Colors.transparent,
                  child: Text('Entregas na hora', style: TextStyle(
                      fontFamily: 'Rajdhani',
                      color: Colors.white.withOpacity(animation.sloganOpacity.value),
                      fontSize: 15.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500)),
                ),
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
  double height = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 650),
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

  void _changeContainerHeight(){
    setState(() {
      height == 0 ? height = 50.0 : height = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
      return Stack(
      children: <Widget>[
        HomePage(),
        SplashPage(
          callback: _changeContainerHeight,
          height: height,
          controller: _controller,
          screenHeight: screenHeight,
        ),
      ],
    );
  }
}