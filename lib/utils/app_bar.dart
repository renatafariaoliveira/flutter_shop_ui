import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_shop/utils/constants.dart';
import 'package:flutter_shop/utils/theme.dart';

class CustomAppBar {
  final Color barColor;
  final Color textColor;
  final bool visible;
  final BuildContext context;
  CustomAppBar({
    this.barColor = Colors.white,
    this.textColor = kTextColor,
    this.visible = false,
    this.context,
  });

  AppBar get() {
    return AppBar(
      backgroundColor: barColor,
      elevation: 0,
      leading: Visibility(
        visible: visible,
        child: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: textColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: textColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: textColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
