import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/size_config.dart';
import "package:flutter/material.dart";

class ProductItem extends StatelessWidget {
  final Clothes clothes;

  const ProductItem({Key? key, required this.clothes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: getProportionateScreenWidth(context, 10),
      ),
      width: getProportionateScreenWidth(context, 200),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/details", arguments: clothes);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: getProportionateScreenHeight(context, 180),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(clothes.imageUrl.toString()),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 15,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: eSecondaryColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  clothes.productName.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.6,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenHeight(context, 5),
                ),
                child: Text(
                  clothes.price.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
