import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(context, 18),
        vertical: getProportionateScreenWidth(context, 18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: getWidth(context) * 0.8,
              decoration: BoxDecoration(
                color: eSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(context, 20),
                    vertical: getProportionateScreenWidth(context, 9),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search Product",
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(
              getProportionateScreenWidth(context, 12),
            ),
            decoration: BoxDecoration(
              color: eSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }
}
