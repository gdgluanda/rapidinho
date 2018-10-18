import 'package:flutter/material.dart';
import 'package:rapidinho/repository/place_entity.dart';

class PlacesTab extends StatefulWidget {

  final List<Result> places;
  final bool isLoading;

  PlacesTab({@required this.places, this.isLoading});

  @override
  _PlacesTabState createState() => _PlacesTabState();
}

class _PlacesTabState extends State<PlacesTab> {

  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: widget.places.map((Result place){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${place.name}', style: Theme.of(context).textTheme.body2),
                Container(
                  height: 50.0,
                  child: ListView(
                    children: place.photos.map((photo){
                      return Text('${photo.photoReference}', style: Theme.of(context).textTheme.body1);
                    }).toList(),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
