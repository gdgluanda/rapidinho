import 'package:rapidinho/data/data.dart';
import 'package:meta/meta.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/tabs.dart';
import 'package:rapidinho/redux/product/product_state.dart';

@immutable
class AppState {
  final NavigationTab activeTab;
  final List<FilterItem> filters;
  final ProductState productState;

  AppState({
    this.productState,
    this.activeTab,
    this.filters,
  });

  factory AppState.init() =>
      AppState(
        activeTab: NavigationTab.Home,
        filters: filterList,
        productState: ProductState.initial()
      );

  AppState copyWith({
    NavigationTab activeTab,
    List<FilterItem> filters,
    ProductState productState,
  }){
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      filters: filters ?? this.filters,
      productState: productState ?? this.productState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              filters == other.filters &&
              productState == other.productState;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      filters.hashCode ^
      productState.hashCode;

  @override
  String toString() {
    return 'AppState{activeTab: $activeTab, filters: $filters, productState: $productState}';
  }
}