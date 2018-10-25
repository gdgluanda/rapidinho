import 'package:rapidinho/model/loading_status.dart';
import 'package:rapidinho/redux/product/product_state.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/redux/product/product_actions.dart';

final productReducer = combineReducers<ProductState>([
  TypedReducer<ProductState, LoadProductPlacesAction>(_loadProductPlaces),
  TypedReducer<ProductState, ProductPlacesLoadedAction>(_setProductPlacesLoaded),
  TypedReducer<ProductState, ErrorLoadingProductPlacesAction>(_errorLoadingProductPlaces),
]);

ProductState _loadProductPlaces(ProductState state,
    LoadProductPlacesAction action) =>
    state.copyWith(loadingStatus: LoadingStatus.loading);

ProductState _setProductPlacesLoaded(ProductState state,
    ProductPlacesLoadedAction action) =>
    state.copyWith(loadingStatus: LoadingStatus.success);

ProductState _errorLoadingProductPlaces(ProductState state,
    ErrorLoadingProductPlacesAction action) =>
    state.copyWith(loadingStatus: LoadingStatus.error);
