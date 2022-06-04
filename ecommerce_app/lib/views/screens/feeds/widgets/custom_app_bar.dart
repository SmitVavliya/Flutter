import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(context, 20)),
        child: Container(
          height: getProportionateScreenWidth(context, 40),
          alignment: Alignment.center,
          child: Text(
            "Feeds Products",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(context, 20),
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
