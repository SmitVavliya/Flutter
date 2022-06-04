import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/clothes.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class ProductImage extends StatefulWidget {
  late Clothes product;

  ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImage> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    final double width = getWidth(context);
    final double hw = width / (widget.product.imageChildren!.length + 4);

    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(context, 238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.productName.toString(),
              child: Image.asset(
                widget.product.imageChildren![selectedImage],
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(context, 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.product.imageChildren!.length,
              (index) => buildSmallProductPreview(index, hw),
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index, double hw) {
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
          widget.product.imageChildren![index],
        ),
      ),
    );
  }
}
