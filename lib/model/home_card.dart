
class HomeCard {

  final String assetPath;
  final String name;
  final List<int> filter;

  HomeCard({this.name, this.assetPath, this.filter});

  @override
  bool operator ==(other) =>
      identical(this, other) &&
      other is HomeCard &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      assetPath == other.assetPath &&
      filter == other.filter;

  @override
  int get hashCode => name.hashCode ^ assetPath.hashCode ^ filter.hashCode;
}