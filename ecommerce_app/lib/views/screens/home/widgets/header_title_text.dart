import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/size_config.dart';
import "package:flutter/material.dart";

class HeaderTitleText extends StatelessWidget {
  const HeaderTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(context, 18),
        vertical: getProportionateScreenHeight(context, 10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "New Arrival",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(context, 22),
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "View All",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(context, 15),
                  fontWeight: FontWeight.w600,
                  color: eSecondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: getProportionateScreenHeight(context, 20),
                color: eSecondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
