import 'package:ecommerce_app/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/providers/products_provider.dart';
import '../../../../size_config.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImage> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    final ProductsProvider products = Provider.of<ProductsProvider>(context);
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final product = products.findById(productId);

    final double width = getWidth(context);
    final double hw = width / (product.imageChildren.length + 4);

    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(context, 238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: product.title.toString(),
              child: Image.asset(
                product.imageChildren[selectedImage],
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(context, 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              product.imageChildren!.length,
              (index) => buildSmallProductPreview(index, hw),
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index, double hw) {
    final ProductsProvider products = Provider.of<ProductsProvider>(context);
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final product = products.findById(productId);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: getProportionateScreenWidth(context, hw),
        width: getProportionateScreenWidth(context, hw),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ePrimaryColor.withOpacity(
              selectedImage == index ? 1 : 0,
            ),
          ),
        ),
        child: Image.asset(
          product.imageChildren[index],
        ),
      ),
    );
  }
}
