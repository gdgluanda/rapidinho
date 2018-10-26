import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/model/loading_status.dart';
import 'package:rapidinho/model/place.dart';
import 'package:redux/redux.dart';

class ProductsViewModel {
  final LoadingStatus status;
  final List<Place> productPlaces;
  final List<Photo> productPlacePhotos;

  ProductsViewModel({this.status, this.productPlaces, this.productPlacePhotos});
  static ProductsViewModel fromStore(
    Store<AppState> store,
  ){
    return ProductsViewModel(
      status: store.state.productState.loadingStatus,
      productPlaces: store.state.productState.productPlaces,
      productPlacePhotos: store.state.productState.productPlacePhotos,
    );
  }

  @override
  bool operator ==(Object other) =>
  //TODO Match Iterable Equality for places and photos list
      identical(this, other) ||
          other is ProductsViewModel &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              productPlaces == other.productPlaces &&
              productPlacePhotos == other.productPlacePhotos;

  @override
  int get hashCode =>
      status.hashCode ^
      productPlaces.hashCode ^
      productPlacePhotos.hashCode;
}