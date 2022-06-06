import 'package:ecommerce_app/controllers/providers/products_provider.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/screens/home/widgets/product_item.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products =
        Provider.of<ProductsProvider>(context, listen: false).products;

    return Container(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(context, 18),
      ),
      child: Column(children: [
        SizedBox(
          height: getProportionateScreenHeight(context, 250),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ChangeNotifierProvider.value(
                value: products[index],
                child: const ProductItem(),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ]),
    );
  }
}
