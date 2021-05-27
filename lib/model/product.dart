import 'package:flutter/foundation.dart';
import 'package:rapidinho/database/common.dart' as common;

class Product {
  int id;
  String itemName;
  double price;
  int categoryId;
  String description;
  Map<int, String> ingredients;
  String recipe;
  bool isActive;

  ///New variables
  String recommendations;
  int servings;
  double weight;
  double cookTime, estimatedDeliveryTime;
  List<Product> suggestedProducts;
  List<String> tags;
  double deliveryTax;
  double rating;
  String imagePath;
  int vendorId;

  Product({
    @required this.id,
    this.itemName,
    this.price,
    this.categoryId,
    this.vendorId,
    this.description,
    this.ingredients,
    this.recipe,
    this.isActive,
    this.imagePath,
    this.servings,
    this.weight,
    this.cookTime,
    this.estimatedDeliveryTime,
    this.suggestedProducts,
    this.tags,
    this.deliveryTax,
    this.rating,
    this.recommendations,
  });

  Product copyWith(
      {int id,
      String itemName,
      double price,
      int categoryId,
      String description,
      Map ingredients,
      String recipe,
      bool isActive}) {
    return Product(
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
        common.id: id,
        common.categoryId: categoryId,
        common.itemName: itemName,
        common.description: description,
        common.ingredients: ingredients,
        common.recipe: recipe,
        common.price: price,
        common.active: isActive ? 1 : 0,
      };

  Product.fromMap(Map map) {
    Product(
      id: map[common.id],
      categoryId: map[common.categoryId],
      itemName: map[common.itemName],
      description: map[common.description],
      ingredients: map[common.ingredients],
      recipe: map[common.recipe],
      price: map[common.price],
      isActive: map[common.active] == 1 ? true : false,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
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
