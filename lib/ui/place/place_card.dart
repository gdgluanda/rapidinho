import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:rapidinho/network/keys.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:shimmer/shimmer.dart';

const photoUrl = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=';

class PlaceCard extends StatelessWidget {

  final PlacesSearchResult place;
  final VoidCallback action;

  PlaceCard({this.place, this.action});

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
                        child: place.photos == null ?
                        Image.asset(
                          'assets/images/r_white.jpg',
                          width: 150.0,
                          height: 100.0,
                          fit: BoxFit.fitHeight,
                        ) :
                        FadeInImage.assetNetwork(
                            height: 100.0,
                            width: 150.0,
                            placeholder: 'assets/images/1x1_transparent.png',
                            image: '$photoUrl${place.photos[0].photoReference}&key=$googleMapsApiKey',
                            fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 2.0),
                child: Text(
                    place.name != null ? place.name : 'Nome do restaurante',
                    style: RapidinhoTextStyle.normalText.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Stack(
                      children: [
                        Icon(Icons.star, size: 14.0, color: Colors.black54),
                        Icon(Icons.star, size: 13.0, color: Colors.yellow),
                      ],
                    ),
                    Stack(
                      children: [
                        Icon(Icons.star, size: 14.0, color: Colors.black54),
                        Icon(Icons.star, size: 13.0, color: Colors.yellow),
                      ],
                    ),
                    Stack(
                      children: [
                        Icon(Icons.star, size: 14.0, color: Colors.black54),
                        Icon(Icons.star, size: 13.0, color: Colors.yellow),
                      ],
                    ),
                    Stack(
                      children: [
                        Icon(Icons.star_border, size: 14.0, color: Colors.black54),
                        Icon(Icons.star_half, size: 13.0, color: Colors.yellow),
                      ],
                    ),
                    Stack(
                      children: [
                        Icon(Icons.star_border, size: 14.0, color: Colors.black54),
                        Icon(Icons.star_border, size: 13.0, color: Colors.yellow),
                      ],
                    ),
                    Text(' • ', style: TextStyle(color: Colors.black54)),
                    Text(' ${place.rating}', style: RapidinhoTextStyle.smallText),
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index){
          return Container(
            constraints: BoxConstraints(maxHeight: 160.0),
            child: Card(
              elevation: 4.0,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.all(8.0),
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
          );
        },
      )
    );
  }
}
