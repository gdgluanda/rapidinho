
class FilterItem {

  final String name;
  final bool isFilter;
  final FilterType type;
  const FilterItem(this.name, this.isFilter, this.type);

  FilterItem copyWith({String name, bool isFilter, FilterType type}){
    return FilterItem(
      name ?? this.name,
      isFilter ?? this.isFilter,
      type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FilterItem &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              isFilter == other.isFilter;

  @override
  int get hashCode =>
      name.hashCode ^
      isFilter.hashCode;

  @override
  String toString() {
    return 'FilterItem{name: $name, isFilter: $isFilter}';
  }
}

enum FilterType {All, Today, Recommended, Allowed, Popular, New}