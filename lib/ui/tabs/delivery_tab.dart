import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/network/keys.dart';
import 'package:rapidinho/ui/widget/delivery_card.dart';
import 'package:google_maps_webservice/directions.dart';

class DeliveryTab extends StatefulWidget {
  DeliveryTab();

  @override
  _DeliveryTabState createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab>
    with TickerProviderStateMixin {
  final directions =
      new GoogleMapsDirections(Platform.environment[googleMapsApiKey]);
  PageController _pageController = PageController(viewportFraction: 0.85);
  GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // removed option parameter from GoogleMap
          // initialCameraPosition is required (replaced with option parameter)
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(16.7754,
                  96.1418), // initialize the latitude and logitude after map created
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 200.0,
              child: PageView(
                onPageChanged: _changeLocation,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: MockData.deliveries.map((product) {
                  return DeliveryCard(deliveryProduct: product);
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  _changeLocation(int pageIndex) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: MockData.deliveries[pageIndex].latLng,
        zoom: 17.0,
      ),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
