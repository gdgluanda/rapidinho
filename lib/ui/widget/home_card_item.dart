import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class HomeItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: const BoxConstraints(maxHeight: 120.0),
      margin: const EdgeInsets.only(top: 20.0),
      child: new Align(
        alignment: Alignment.center,
        child: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                left: 10.0, bottom: 20.0, right: 10.0, top: 10.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildCardItem(
                  "Live\nBroadcast", () {}, Colors.red,
                  new AssetImage("assets/images/featured_meal.jpg")),
              _buildCardItem(
                  "My\nWallet", () {}, Colors.red,
                  new AssetImage("assets/images/featured_meal.jpg")),
              _buildCardItem(
                  "Game\nCenter", () {}, Colors.red,
                  new AssetImage("assets/images/featured_meal.jpg")),
              _buildCardItem(
                  "Game\nCenter", () {}, Colors.red,
                  new AssetImage("assets/images/featured_meal.jpg")),
            ]
        ),
      ),
    );
  }

  Widget _buildCardItem(String title, VoidCallback action, Color color, ImageProvider backgroundImage) {
    return new GestureDetector(
      onTap: action,
      child: new Stack(
        children: <Widget>[
          new Align(
            alignment: Alignment.centerRight,
            child: new Container(
              margin: const EdgeInsets.only(right: 5.0, left: 5.0),
              width: 150.0,
              decoration: new BoxDecoration(
                color: Colors.red,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(color: Colors.black38,
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: new Offset(0.0, 1.0)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: new Image(
                  fit: BoxFit.cover,
                  image: backgroundImage != null
                      ? backgroundImage
                      : new AssetImage("assets/images/microphone.png"),
                ),
              ),
            ),
          ),  // END BACKGROUND IMAGE
          Container(
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(5.0),
              color: Colors.black12.withOpacity(0.2)
            ),
            width: 150.0,
            height: 150.0,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 5.0, right: 10.0, top: 0.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(title, style: RapidinhoTextStyle.mediumText.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}