import 'package:meta/meta.dart';
import 'package:rapidinho/model/loading_status.dart';
import 'package:rapidinho/model/place.dart';

@immutable
class ProductState {
  final List<Result> productPlaces;
  final List<Photo> productPlacePhotos;
  final LoadingStatus loadingStatus;

  ProductState({this.productPlaces, this.productPlacePhotos, this.loadingStatus});
  factory ProductState.initial(){
    return ProductState(
      productPlaces: [],
      productPlacePhotos: [],
      loadingStatus: LoadingStatus.loading,
    );
  }

  ProductState copyWith({
    LoadingStatus loadingStatus,
    List<Result> productPlaces,
    List<Photo> productPhotos,
  }) {
    return ProductState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      productPlaces: productPlaces ?? this.productPlaces,
      productPlacePhotos: productPhotos ?? this.productPlacePhotos,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductState &&
              runtimeType == other.runtimeType &&
              productPlaces == other.productPlaces &&
              productPlacePhotos == other.productPlacePhotos &&
              loadingStatus == other.loadingStatus;

  @override
  int get hashCode =>
      productPlaces.hashCode ^
      productPlacePhotos.hashCode ^
      loadingStatus.hashCode;

  @override
  String toString() {
    return 'ProductState{productPlaces: $productPlaces, productPlacePhotos: $productPlacePhotos, loadingStatus: $loadingStatus}';
  }
}