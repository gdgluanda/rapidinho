import 'package:flutter/material.dart';
import 'package:rapidinho/repository/place_entity.dart';

class PlacesTab extends StatefulWidget {

  final List<Result> places;

  PlacesTab({@required this.places});

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
          children: widget.places.map((place){
            return Text('This place is named: ${place.name}');
          }).toList(),
        ),
      ),
    );
  }
}
