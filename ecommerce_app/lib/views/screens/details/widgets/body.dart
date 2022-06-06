import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/views/screens/details/widgets/product_description.dart';
import 'package:ecommerce_app/views/screens/details/widgets/product_image.dart';
import 'package:ecommerce_app/views/screens/details/widgets/top_rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: getProportionateScreenWidth(context, 5)),
        const ProductImage(),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              const ProductDescription(),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getWidth(context) * 0.15,
                    right: getWidth(context) * 0.15,
                    bottom: getProportionateScreenWidth(context, 40),
                    top: getProportionateScreenWidth(context, 15),
                  ),
                  child: DefaultButton(
                    text: "Add To Cart",
                    backgroundColor: ePrimaryColor,
                    onPressed: () {},
                    isLoading: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}