import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../const.dart';
import '../../../../size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback onPress;

  const IconBtnWithCounter({
    this.numOfitem = 0,
    required this.svgSrc,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onPress,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(context, 12)),
            height: getProportionateScreenWidth(context, 46),
            width: getProportionateScreenWidth(context, 46),
            decoration: BoxDecoration(
              color: eSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(context, 16),
                width: getProportionateScreenWidth(context, 16),
                decoration: BoxDecoration(
                  color: ePrimaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(context, 10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
