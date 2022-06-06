import "package:flutter/material.dart";

import '../../models/products.dart';

class ProductsProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: "1",
      title:
          "EIO® 100% Cotton Rompers/Sleepsuits/Jumpsuit/Night Suits for Newborn Baby Boys & Girls Pack of 3",
      description:
          "strong product details:strongppthis casual solid shirt has a slim collar, a full button placket, long sleeves, and a curved hemlinepstrong size and fitstrongpullislim fitlilithe Model (height 6 foot and shoulders 18 inches is wearing size 40/mliliplease check the size chart for more details before orderinglipstrong material & carestrongpp100% premium cotton(machine wash regular)pstrong style tipstrongppenhance your look by wearing this trendy shirt. Team it with a pair of denim and white sneakers for a fun casual lookpstrong about the brand dennis lingostrongppfinding basic menswear can be hard among todays fast fashion world, where trends change daily. That’s why we started Dennis Lingo, to create a one stop shop for basic menswear clothing for everyday use at the half the price of traditional retail without compromising on the qualithy by selling directly to you without any middleman. We want to disrupt how men shop one shirt at a timep.",
      price: 70.99,
      imageUrl: "assets/images/clothes/cloth1.1.jpg",
      imageChildren: [
        "assets/images/clothes/cloth1.1.jpg",
        "assets/images/clothes/cloth1.2.jpg",
        "assets/images/clothes/cloth1.3.jpg",
        "assets/images/clothes/cloth1.4.jpg",
        "assets/images/clothes/cloth1.5.jpg",
        "assets/images/clothes/cloth1.6.jpg",
      ],
      productCategoryName: "clothes",
      quantity: 2,
      rating: 4.1,
    ),
    Product(
      id: "2",
      title: "Dennis Lingo Men's Slim Casual Shirt",
      description:
          "strong product details:strongppthis casual solid shirt has a slim collar, a full button placket, long sleeves, and a curved hemlinepstrong size and fitstrongpullislim fitlilithe Model (height 6 foot and shoulders 18 inches is wearing size 40/mliliplease check the size chart for more details before orderinglipstrong material & carestrongpp100% premium cotton(machine wash regular)pstrong style tipstrongppenhance your look by wearing this trendy shirt. Team it with a pair of denim and white sneakers for a fun casual lookpstrong about the brand dennis lingostrongppfinding basic menswear can be hard among todays fast fashion world, where trends change daily. That’s why we started Dennis Lingo, to create a one stop shop for basic menswear clothing for everyday use at the half the price of traditional retail without compromising on the qualithy by selling directly to you without any middleman. We want to disrupt how men shop one shirt at a timep.",
      price: 99.99,
      imageUrl: "assets/images/clothes/cloth2.1.jpg",
      imageChildren: [
        "assets/images/clothes/cloth2.1.jpg",
        "assets/images/clothes/cloth2.2.jpg",
        "assets/images/clothes/cloth2.3.jpg",
        "assets/images/clothes/cloth2.4.jpg",
        "assets/images/clothes/cloth2.5.jpg",
        "assets/images/clothes/cloth2.6.jpg",
      ],
      productCategoryName: "clothes",
      quantity: 2,
      rating: 3.9,
    ),
    Product(
      id: "3",
      title: "Dennis Lingo Men's Solid Slim Fit Shirt",
      description:
          "This Casual Checkered shirt has a spread collar, A full button Placket, Long Sleeves, Yoke on the shoulder, and a curved hemline Size and Fit Slim Fit The Model (height 6 foot and shoulders 18 inches is wearing size 40/Please check the size chart for more details before ordering Material & Care100% Premium Cotton (Machine Wash Regular)Style Tip Enhance your look by wearing this trendy shirt. Team it with a pair of Chinos and white sneakers for a fun Smart Casual look About the Brand DENNIS LINGO Finding Basic Menswear for daily use can be hard among todays Fast fashion world, where trends change daily. That's why we started Dennis Lingo, to create a one stop shop for premium essential clothing for everyday use at rock bottom prices",
      price: 80.99,
      imageUrl: "assets/images/clothes/cloth3.1.jpg",
      imageChildren: [
        "assets/images/clothes/cloth3.1.jpg",
        "assets/images/clothes/cloth3.2.jpg",
        "assets/images/clothes/cloth3.3.jpg",
        "assets/images/clothes/cloth3.4.jpg",
        "assets/images/clothes/cloth3.5.jpg",
        "assets/images/clothes/cloth3.6.jpg",
      ],
      productCategoryName: "clothes",
      quantity: 2,
      rating: 4.0,
    ),
    Product(
      id: "4",
      title: "Amazon Brand - Jam & Honey Baby Boys Romper Suit",
      description:
          "Jam & honey brings to you clothing for your little one. Designed for a kid’s comfort, these are carefully made from 100% soft cotton for all day comfort. In a practical pack of five, these fun - inspired rompers are designed with printed back-neck labels which are supersoft against your baby's neck. Nickel-free poppers ensure no irritation to delicate skin, keeping your baby safe.",
      price: 56.78,
      imageUrl: "assets/images/clothes/cloth4.1.jpg",
      imageChildren: [
        "assets/images/clothes/cloth4.1.jpg",
        "assets/images/clothes/cloth4.2.jpg",
        "assets/images/clothes/cloth4.3.jpg",
        "assets/images/clothes/cloth4.4.jpg",
      ],
      productCategoryName: "clothes",
      quantity: 2,
      rating: 4.3,
    ),
    Product(
      id: "5",
      title: "Chromozome Men's Regular Fit OS 10 Pack of 3",
      description: "Chromozome Men's Plain Reqular fit T-shirt ( Pack of 3 )",
      price: 100.99,
      imageUrl: "assets/images/clothes/cloth5.1.jpg",
      imageChildren: [
        "assets/images/clothes/cloth5.1.jpg",
        "assets/images/clothes/cloth5.2.jpg",
        "assets/images/clothes/cloth5.3.jpg",
        "assets/images/clothes/cloth5.4.jpg",
        "assets/images/clothes/cloth5.5.jpg",
        "assets/images/clothes/cloth5.6.jpg",
      ],
      productCategoryName: "clothes",
      quantity: 2,
      rating: 3.9,
    ),
  ];

  List<Product> get products => _products;

  Product findById(String productId) {
    return _products.firstWhere((product) => product.id == productId);
  }
}
