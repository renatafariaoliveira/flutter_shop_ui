import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/home/home_widget.dart';
import 'package:flutter_shop/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ShopUI());
}

class ShopUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop UI',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.getFont('Lato').fontFamily,
      ),
      home: HomeWidget(),
    );
  }
}
