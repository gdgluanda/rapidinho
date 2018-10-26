
class Product {

  final String assetPath;
  final String name;
  final List<int> filter;

  Product({this.name, this.assetPath, this.filter});

  @override
  bool operator ==(other) =>
      identical(this, other) &&
      other is Product &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      assetPath == other.assetPath &&
      filter == other.filter;

  @override
  int get hashCode => name.hashCode ^ assetPath.hashCode ^ filter.hashCode;

  @override
  String toString() {
    return 'HomeCard{assetPath: $assetPath, name: $name, filter: $filter}';
  }
}

enum ProductCategory {
  Book,
  Drinks,
  Food,
  Hamburger,
  IceCream,
  Invites,
  Mail,
  Pizza,
  Present,
  Wear,
}