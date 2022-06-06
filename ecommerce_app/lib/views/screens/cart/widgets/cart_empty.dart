import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/components/default_button.dart';
import "package:flutter/material.dart";

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: getHeight(context) * 0.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/emptycart.png"),
            ),
          ),
        ),
        const Text(
          "Your Cart is Empty",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(context, 10),
          ),
          child: const Text(
            "Looks like you haven't added\nanything to your cart yet",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: getWidth(context) * 0.7,
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(context, 20),
          ),
          child: DefaultButton(
            text: "Shop Now",
            onPressed: () {},
            backgroundColor: ePrimaryColor,
            isLoading: false,
          ),
        ),
      ],
    );
  }
}
