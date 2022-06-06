import 'package:ecommerce_app/controllers/providers/products_provider.dart';
import 'package:ecommerce_app/views/screens/details/widgets/body.dart';
import 'package:ecommerce_app/views/screens/details/widgets/custom_app_bar.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsProvider products = Provider.of<ProductsProvider>(context);
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final product = products.findById(productId);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: double.parse(
            product.rating.toString(),
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
