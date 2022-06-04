import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/views/screens/details/widgets/body.dart';
import 'package:ecommerce_app/views/screens/details/widgets/custom_app_bar.dart';
import "package:flutter/material.dart";

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Clothes clothes =
        ModalRoute.of(context)!.settings.arguments as Clothes;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: double.parse(
            clothes.rating.toString(),
          ),
        ),
      ),
      body: Body(product: clothes),
    );
  }
}
