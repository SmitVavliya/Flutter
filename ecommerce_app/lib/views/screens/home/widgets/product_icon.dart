import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/screens/home/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../../../../models/category.dart';

class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;

  const ProductIcon({Key? key, required this.model, required this.onSelected})
      : super(key: key);

  static EdgeInsets hPadding = const EdgeInsets.symmetric(horizontal: 10);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(model),
      child: Container(
        margin:
            EdgeInsets.only(right: getProportionateScreenWidth(context, 18)),
        child: Container(
          padding: hPadding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: model.isSelected ? Colors.white : Colors.transparent,
            border: Border.all(
              color: model.isSelected ? ePrimaryColor : Colors.grey,
              width: model.isSelected ? 2 : 1,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color:
                    model.isSelected ? const Color(0xfffbf2ef) : Colors.white,
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(model.image),
              ),
              TitleText(
                text: model.name,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
