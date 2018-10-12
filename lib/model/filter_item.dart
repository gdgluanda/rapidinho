
class FilterItem {

  String name;
  bool isFilter;

  FilterItem(this.name, this.isFilter);

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