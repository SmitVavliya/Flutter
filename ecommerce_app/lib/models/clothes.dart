class Clothes {
  String? productName;
  String? price;
  String? imageUrl;
  List<String>? imageChildren;
  double? rating;

  Clothes({
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.imageChildren,
    required this.rating,
  });

  static List<Clothes> generateClothes() {
    return [
      Clothes(
        productName:
            "EIO® 100% Cotton Rompers/Sleepsuits/Jumpsuit/Night Suits for Newborn Baby Boys & Girls Pack of 3",
        price: "\$70.99",
        imageUrl: "assets/images/clothes/cloth1.1.jpg",
        imageChildren: [
          "assets/images/clothes/cloth1.1.jpg",
          "assets/images/clothes/cloth1.2.jpg",
          "assets/images/clothes/cloth1.3.jpg",
          "assets/images/clothes/cloth1.4.jpg",
          "assets/images/clothes/cloth1.5.jpg",
          "assets/images/clothes/cloth1.6.jpg",
        ],
        rating: 4.1,
      ),
      Clothes(
        productName: "Dennis Lingo Men's Slim Casual Shirt",
        price: "\$80.99 ",
        imageUrl: "assets/images/clothes/cloth2.1.jpg",
        imageChildren: [
          "assets/images/clothes/cloth2.1.jpg",
          "assets/images/clothes/cloth2.2.jpg",
          "assets/images/clothes/cloth2.3.jpg",
          "assets/images/clothes/cloth2.4.jpg",
          "assets/images/clothes/cloth2.5.jpg",
          "assets/images/clothes/cloth2.6.jpg",
        ],
        rating: 3.9,
      ),
      Clothes(
        productName: "Dennis Lingo Men's Solid Slim Fit Shirt",
        price: "\$80.99 ",
        imageUrl: "assets/images/clothes/cloth3.1.jpg",
        imageChildren: [
          "assets/images/clothes/cloth3.1.jpg",
          "assets/images/clothes/cloth3.2.jpg",
          "assets/images/clothes/cloth3.3.jpg",
          "assets/images/clothes/cloth3.4.jpg",
          "assets/images/clothes/cloth3.5.jpg",
          "assets/images/clothes/cloth3.6.jpg",
        ],
        rating: 4.0,
      ),
      Clothes(
        productName: "Amazon Brand - Jam & Honey Baby Boys Romper Suit",
        price: "\$80.99 ",
        imageUrl: "assets/images/clothes/cloth4.1.jpg",
        imageChildren: [
          "assets/images/clothes/cloth4.1.jpg",
          "assets/images/clothes/cloth4.2.jpg",
          "assets/images/clothes/cloth4.3.jpg",
          "assets/images/clothes/cloth4.4.jpg",
        ],
        rating: 4.3,
      ),
      Clothes(
        productName: "Chromozome Men's Regular Fit OS 10 Pack of 3",
        price: "\$80.99 ",
        imageUrl: "assets/images/clothes/cloth5.1.jpg",
        imageChildren: [
          "assets/images/clothes/cloth5.1.jpg",
          "assets/images/clothes/cloth5.2.jpg",
          "assets/images/clothes/cloth5.3.jpg",
          "assets/images/clothes/cloth5.4.jpg",
          "assets/images/clothes/cloth5.5.jpg",
          "assets/images/clothes/cloth5.6.jpg",
        ],
        rating: 3.9,
      ),
    ];
  }
}
