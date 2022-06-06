import 'package:ecommerce_app/controllers/providers/products_provider.dart';
import 'package:ecommerce_app/views/screens/feeds/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/views/screens/feeds/widgets/feeds_products.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../../../models/products.dart';
import '../../../size_config.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products =
        Provider.of<ProductsProvider>(context, listen: false).products;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(context, 10),
          top: getProportionateScreenWidth(context, 10),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: getProportionateScreenHeight(context, 180) /
              getProportionateScreenWidth(context, 250),
          children: List.generate(
            products.length,
            (int index) => ChangeNotifierProvider.value(
              value: products[index],
              child: const FeedsProducts(),
            ),
          ),
        ),
      ),
    );
  }
}
