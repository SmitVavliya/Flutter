import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> imageChildren;
  final String productCategoryName;
  final int quantity;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.imageChildren,
    required this.productCategoryName,
    required this.quantity,
    required this.rating,
  });
}
