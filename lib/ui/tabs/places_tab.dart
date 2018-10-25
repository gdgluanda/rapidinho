import 'package:flutter/material.dart';
import 'package:rapidinho/model/place.dart';
import 'package:rapidinho/ui/widget/loading_indicator.dart';

class PlacesTab extends StatelessWidget {

  final List<Result> places;
  final bool isLoading;

  PlacesTab({@required this.places, this.isLoading});

  _buildListOfPlaces(BuildContext context){
    return Container(
      child: ListView(
        children: places.map((Result place){
          print('Number of photos: ${place.photos.length}');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${place.name}', style: Theme.of(context).textTheme.body2),
              Container(
                height: 50.0,
                child: ListView(
                  children: place.photos.map((photo){
                    return Text('${photo.height}', style: Theme.of(context).textTheme.body1);
                  }).toList(),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? LoadingIndicator() : _buildListOfPlaces(context),
    );
  }
}
