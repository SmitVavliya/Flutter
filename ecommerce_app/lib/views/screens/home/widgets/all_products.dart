import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/screens/home/widgets/product_item.dart';
import "package:flutter/material.dart";

import '../../../../models/clothes.dart';

class AllProducts extends StatelessWidget {
  final List<Clothes> clothesList = Clothes.generateClothes();

  AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(context, 18),
      ),
      child: Column(children: [
        SizedBox(
          height: getProportionateScreenHeight(context, 250),
          child: ListView.builder(
            itemCount: clothesList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(clothes: clothesList[index]);
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ]),
    );
  }
}
