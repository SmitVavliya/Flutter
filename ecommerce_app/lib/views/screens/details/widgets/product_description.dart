import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/providers/products_provider.dart';
import '../../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsProvider products = Provider.of<ProductsProvider>(context);
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final product = products.findById(productId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(context, 18),
          ),
          child: Text(
            product.title!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(context, 15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: getProportionateScreenWidth(context, 64),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: Colors.red,
              height: getProportionateScreenWidth(context, 16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(context, 18),
            right: getProportionateScreenWidth(context, 18),
          ),
          child: Text(product.description),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(context, 18),
            right: getProportionateScreenWidth(context, 18),
            top: getProportionateScreenWidth(context, 18),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Price: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '\$${product.price.toString()}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
