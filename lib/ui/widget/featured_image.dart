import 'package:flutter/material.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class FeaturedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height / 3.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/rapidinho_cover.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter.add(Alignment(0.0, 0.3)),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.black38,
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 1.0)),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: TextField(
                  style: RapidinhoTextStyle.mediumText,
                  decoration: InputDecoration(
                    hintText: 'Pesquise aqui...',
                    border: InputBorder.none,
                  ),
                  onChanged: (text){
                    //TODO add search action here
                  },
                  onSubmitted: (text){
                    //TODO add search action here
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
