import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/screens/home/widgets/category_item.dart';
import "package:flutter/material.dart";

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(context, 180),
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(context, 10),
        left: getProportionateScreenHeight(context, 18),
      ),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) => CategoryItem(
          index: index,
        ),
      ),
    );
  }
}
