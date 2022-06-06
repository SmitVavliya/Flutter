import "package:flutter/material.dart";

import '../../models/cart_attr.dart';

class CartProvider extends ChangeNotifier {
  Map<String, CartAttr> _cartItems = {
    // "1": CartAttr(
    //   id: "1",
    //   title:
    //       "EIO® 100% Cotton Rompers/Sleepsuits/Jumpsuit/Night Suits for Newborn Baby Boys & Girls Pack of 3",
    //   price: 70.99,
    //   imageUrl: "assets/images/clothes/cloth1.1.jpg",
    //   quantity: 2,
    // )
  };

  Map<String, CartAttr> get cartItems => _cartItems;

  double get totalAmount {
    double total = 0.0;

    _cartItems.forEach((key, value) {
      total = total + value.price * value.quantity;
    });

    return total;
  }
}
