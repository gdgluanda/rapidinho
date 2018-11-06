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

class _DeliveryTabState extends State<DeliveryTab> with TickerProviderStateMixin {

  final directions = new GoogleMapsDirections(Platform.environment[googleMapsApiKey]);
  PageController _pageController = PageController(viewportFraction: 0.85);
  GoogleMapController mapController;
  GoogleMapOptions _options = GoogleMapOptions(
    cameraPosition: const CameraPosition(
      target: LatLng(-8.885533, 13.253325),
      zoom: 14.0,
    ),
    trackCameraPosition: true,
    compassEnabled: true,
  );

//  @override
//  void initState() async {
//    super.initState();
//    DirectionsResponse res = await directions.directionsWithLocation(
//        Location(-8.914714, 13.347579), Location(-8.770387, 13.252518),
//        travelMode: TravelMode.bicycling,
//        waypoints: Waypoint.fromLocation(Location(-8.854382, 13.358283)),
//    );
//    print('Direction API response: ${res.status}');
//  }

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
          GoogleMap(
            onMapCreated: _onMapCreated,
            options: _options,
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
                  return DeliveryCard(
                      deliveryProduct: product
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  _changeLocation(int pageIndex){
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: MockData.deliveries[pageIndex].latLng,
        zoom: 17.0,
      ),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }
}