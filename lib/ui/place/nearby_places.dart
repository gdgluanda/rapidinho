import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:rapidinho/ui/widget/error_view.dart';
import 'package:rapidinho/ui/place/place_view_model.dart';
import 'package:rapidinho/ui/place/place_card.dart';
import 'package:rapidinho/ui/widget/loading_view.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NearbyPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlaceViewModel>(
      distinct: true,
      converter: (store) => PlaceViewModel.fromStore(store),
      builder: (_, vm){
        return LoadingView(
          status: vm.status,
          loadingContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text('Restaurantes nas proximindades', style: RapidinhoTextStyle.mediumText),
                  ],
                ),
              ),
              LoadingProductCard(),
            ],
          ),
          successContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text('Restaurantes nas proximindades', style: RapidinhoTextStyle.mediumText),
                    Text(' • ', style: TextStyle(color: Colors.black, fontSize: 20.0)),
                    Text(' ${vm.places.length}', style: RapidinhoTextStyle.mediumText),
                  ],
                ),
              ),
              SizedBox(
                height: 160.0,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.places.length,
                    itemBuilder: (context, index) {
                      return PlaceCard(place: vm.places[index]);
                    }
                ),
              ),
            ],
          ),
          errorContent: ErrorView(onRetry: vm.refreshPlaces),
        );
      },
    );
  }
}
