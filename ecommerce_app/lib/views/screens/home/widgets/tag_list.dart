import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/screens/home/widgets/product_icon.dart';
import "package:flutter/material.dart";

import '../../../../models/data.dart';

class TagList extends StatefulWidget {
  const TagList({Key? key}) : super(key: key);

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: getProportionateScreenWidth(context, 18)),
      width: getWidth(context),
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map(
              (Category category) => ProductIcon(
                model: category,
                onSelected: (Category model) {
                  setState(() {
                    for (var item in AppData.categoryList) {
                      item.isSelected = false;
                    }
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
