import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/size_config.dart';
import "package:flutter/material.dart";

class FeedsProduct extends StatelessWidget {
  const FeedsProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: getProportionateScreenWidth(context, 10),
      ),
      width: getProportionateScreenWidth(context, 200),
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
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/clothes/cloth1.1.jpg"),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "EIO® 100% Cotton Rompers/Sleepsuits/Jumpsuit/Night Suits for Newborn Baby Boys & Girls Pack of 3",
                style: TextStyle(
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
              child: const Text(
                "\$70.99",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
