import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class CartCard extends StatelessWidget {
  final CartAttr cart;

  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding:
                    EdgeInsets.all(getProportionateScreenWidth(context, 10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(cart.imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "\$${cart.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ePrimaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: " x${cart.quantity}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
