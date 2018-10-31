import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:rapidinho/ui/widget/error_view.dart';
import 'package:rapidinho/ui/product/products_view_model.dart';
import 'package:rapidinho/ui/product/product_card.dart';
import 'package:rapidinho/ui/widget/loading_view.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NearbyPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsViewModel>(
      distinct: true,
      converter: (store) => ProductsViewModel.fromStore(store),
      builder: (_, vm){
        print('Places length: ${vm.productPlaces.length}');
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
                    Text(' ${vm.productPlaces.length}', style: RapidinhoTextStyle.mediumText),
                  ],
                ),
              ),
              SizedBox(
                height: 160.0,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.productPlaces.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        vm.productPlaces[index].name,
                        homeCardItemList1[index].name, () {},
                        AssetImage(homeCardItemList1[index].assetPath),
                        rating: vm.productPlaces[index].rating.toString(),
                      );
                    }
                ),
              ),
            ],
          ),
          errorContent: ErrorView(onRetry: vm.refreshProducts),
        );
      },
    );
  }
}
