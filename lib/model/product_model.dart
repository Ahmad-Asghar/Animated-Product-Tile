import 'dart:ui';

class ProductModel {
  final String productName;
  final int price;
  final int rating;
  final int count;
  final Color color;
  final String image;
  final String details;
  bool isExpanded;
  bool showMainChildWidgets;
  bool animateMainChildWidgets;
  bool animateChildChildWidgets;
  bool showChildChildWidgets;
  bool expandChildTile;

  ProductModel({
    required this.productName,
    required this.price,
    required this.rating,
    required this.count,
    required this.color,
    required this.image,
    required this.details,
    this.isExpanded = false,
    this.showChildChildWidgets = false,
    this.animateChildChildWidgets = false,
    this.animateMainChildWidgets = true,
    this.showMainChildWidgets = true,
    this.expandChildTile = false,
  });
}
