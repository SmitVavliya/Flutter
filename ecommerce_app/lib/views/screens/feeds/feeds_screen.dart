import 'package:ecommerce_app/views/screens/feeds/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/views/screens/feeds/widgets/feeds_product.dart';
import "package:flutter/material.dart";

import '../../../size_config.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: List.generate(50, (int index) => const FeedsProduct()),
        ),
      ),
    );
  }
}
