import 'package:ecommerce_app/models/clothes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  late Clothes product;

  ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(context, 18),
          ),
          child: Text(
            product.productName!,
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
          child: const Text(
            "strong product details:strongppthis casual solid shirt has a slim collar, a full button placket, long sleeves, and a curved hemlinepstrong size and fitstrongpullislim fitlilithe Model (height 6 foot and shoulders 18 inches is wearing size 40/mliliplease check the size chart for more details before orderinglipstrong material & carestrongpp100% premium cotton(machine wash regular)pstrong style tipstrongppenhance your look by wearing this trendy shirt. Team it with a pair of denim and white sneakers for a fun casual lookpstrong about the brand dennis lingostrongppfinding basic menswear can be hard among todays fast fashion world, where trends change daily. That’s why we started Dennis Lingo, to create a one stop shop for basic menswear clothing for everyday use at the half the price of traditional retail without compromising on the qualithy by selling directly to you without any middleman. We want to disrupt how men shop one shirt at a timep.",
          ),
        ),
      ],
    );
  }
}
