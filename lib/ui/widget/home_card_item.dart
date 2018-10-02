
import 'package:flutter/material.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class HomeCardItem extends StatelessWidget {

  final String title;
  final VoidCallback action;
  final Color color;
  final ImageProvider backgroundImage;

  HomeCardItem(this.title, this.action, this.color, this.backgroundImage);

  @override
  Widget build(BuildContext context) {
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
