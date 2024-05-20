import 'package:flutter/material.dart';
import 'package:sniperdriver/widgets/color.dart';

class AppBarDesign {
  static AppBar buildAppBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      flexibleSpace: const Center(
        child: Image(
          image: AssetImage("assets/images/SniperLogo.png"),
          width: 150,
          height: 50,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
