import 'package:flutter/material.dart';

import '../../const.dart';
import '../../size_config.dart';

class AccountText extends StatelessWidget {
  final String accountText;
  final String text;
  final VoidCallback onTap;

  const AccountText({
    required this.accountText,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountText,
          style: TextStyle(fontSize: getProportionateScreenWidth(context, 16)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(context, 16),
              color: ePrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
