import 'package:ecommerce_app/views/screens/home/widgets/category_list.dart';
import 'package:ecommerce_app/views/screens/home/widgets/all_products.dart';
import 'package:ecommerce_app/views/screens/home/widgets/header_title_text.dart';
import 'package:ecommerce_app/views/screens/home/widgets/icon_btn_with_counter.dart';
import 'package:ecommerce_app/views/screens/home/widgets/product_item.dart';
import 'package:ecommerce_app/views/screens/home/widgets/search_field.dart';
import 'package:ecommerce_app/views/screens/home/widgets/tag_list.dart';
import "package:flutter/material.dart";

import '../../../size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _appBar() {
      return Container(
        padding: EdgeInsets.only(
          top: 50,
          left: getProportionateScreenWidth(context, 18),
          right: getProportionateScreenWidth(context, 18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Howdy, What Are You\nLooking For?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Muli",
                    ),
                  ),
                  WidgetSpan(child: SizedBox(width: 10)),
                  TextSpan(
                    text: "👀",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            IconBtnWithCounter(
              numOfitem: 3,
              svgSrc: "assets/icons/Cart Icon.svg",
              onPress: () {},
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _appBar(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInToLinear,
            switchOutCurve: Curves.easeOutBack,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SearchField(),
                TagList(),
                Category(),
                HeaderTitleText(),
                AllProducts(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
