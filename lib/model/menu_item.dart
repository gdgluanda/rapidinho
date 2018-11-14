import 'package:flutter/foundation.dart';
import 'package:rapidinho/database/common.dart';

class MenuItem {
  int id;
  String itemName;
  double price;
  int categoryId;
  String description;
  Map<int, String> ingredients;
  String recipe;
  bool isActive;

  MenuItem({
    @required this.id,
    this.itemName,
    this.price,
    this.categoryId,
    this.description,
    this.ingredients,
    this.recipe,
    this.isActive
  });

  MenuItem copyWith({int id, String itemName, double price, int categoryId, String description, Map ingredients, String recipe, bool isActive}){
    return MenuItem(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      recipe: recipe ?? this.recipe,
      isActive: isActive ?? this.isActive,
    );
  }

  Map toMap() => {
    ID: id,
    CATEGORY_ID: categoryId,
    ITEM_NAME: itemName,
    DESCRIPTION: description,
    INGREDIENTS: ingredients,
    RECIPE: recipe,
    PRICE: price,
    ACTIVE: isActive ? 1 : 0,
  };

  MenuItem.fromMap(Map map){
    MenuItem(
      id: map[ID],
      categoryId: map[CATEGORY_ID],
      itemName: map[ITEM_NAME],
      description: map[DESCRIPTION],
      ingredients: map[INGREDIENTS],
      recipe: map[RECIPE],
      price: map[PRICE],
      isActive: map[ACTIVE] == 1 ? true : false,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MenuItem &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              itemName == other.itemName &&
              price == other.price &&
              categoryId == other.categoryId &&
              description == other.description &&
              ingredients == other.ingredients &&
              recipe == other.recipe &&
              isActive == other.isActive;

  @override
  int get hashCode =>
      id.hashCode ^
      itemName.hashCode ^
      price.hashCode ^
      categoryId.hashCode ^
      description.hashCode ^
      ingredients.hashCode ^
      recipe.hashCode ^
      isActive.hashCode;

  @override
  String toString() {
    return 'MenuItem{id: $id, itemName: $itemName, price: $price, categoryId: $categoryId, description: $description, ingredients: $ingredients, recipe: $recipe, isActive: $isActive}';
  }
}
