import 'package:flutter/material.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {

  final String title;
  final VoidCallback action;
  final ImageProvider backgroundImage;
  final Animation<double> animation;
  final String placeName;

  ProductCard(this.placeName, this.title, this.action, this.backgroundImage, {this.animation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Card(
        elevation: 4.0,
        child: Container(
          height: 120.0,
          width: 150.0,
          constraints: BoxConstraints(maxHeight: 160.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                        child: Image(
                          width: 150.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                          image: backgroundImage != null ? backgroundImage : AssetImage("assets/images/featured_meal.jpg"),
                        ),
                      ),
                    ),
                  ),  // END BACKGROUND IMAGE
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: <double>[0.0, 0.7, 0.7],
                        colors: <Color>[
                          Colors.black54,
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                      shape: BoxShape.rectangle,
                      //color: Colors.black12.withOpacity(0.2),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                    ),
                    height: 100.0,
                    alignment: Alignment.topLeft,
                    //margin: const EdgeInsets.only(left: 5.0, right: 10.0, top: 0.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 20.0),
                      child: Text(title, style: RapidinhoTextStyle.mediumText.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 2.0),
                child: Text(placeName != null ? placeName : 'Jardim do Eden', style: RapidinhoTextStyle.normalText.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.star, size: 13.0, color: Colors.yellow),
                    Icon(Icons.star, size: 13.0, color: Colors.yellow),
                    Icon(Icons.star, size: 13.0, color: Colors.yellow),
                    Icon(Icons.star_half, size: 13.0, color: Colors.yellow),
                    Icon(Icons.star_border, size: 13.0, color: Colors.yellow),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.0,
      child: Container(
        constraints: BoxConstraints(maxHeight: 160.0),
        child: Card(
          elevation: 4.0,
          clipBehavior: Clip.hardEdge,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[200],
            child: Container(
              height: 120.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: 60.0,
                    height: 8.0,
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 8.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
