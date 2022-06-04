import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/size_config.dart';
import "package:flutter/material.dart";

class CategoryItem extends StatelessWidget {
  int index = 0;

  CategoryItem({Key? key, required this.index}) : super(key: key);

  List<Map<String, Object>> categories = [
    {
      "categoryName": "Phones",
      "categoryImage": "assets/images/CatPhones.png",
    },
    {
      "categoryName": "Clothes",
      "categoryImage": "assets/images/CatClothes.jpg",
    },
    {
      "categoryName": "Laptop",
      "categoryImage": "assets/images/CatLaptops.png",
    },
    {
      "categoryName": "Shoes",
      "categoryImage": "assets/images/CatShoes.jpg",
    },
    {
      "categoryName": "Watches",
      "categoryImage": "assets/images/CatWatches.jpg",
    },
    {
      "categoryName": "Furniture",
      "categoryImage": "assets/images/CatFurniture.jpg",
    },
    {
      "categoryName": "Beauty",
      "categoryImage": "assets/images/CatBeauty.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getProportionateScreenWidth(context, 150),
          height: getProportionateScreenHeight(context, 150),
          margin: EdgeInsets.only(
            right: getProportionateScreenWidth(context, 18),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                categories[index]["categoryImage"].toString(),
              ),
            ),
            color: eSecondaryColor.withOpacity(0.1),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            child: Text(
              categories[index]["categoryName"].toString(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
