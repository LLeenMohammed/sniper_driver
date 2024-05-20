import 'package:flutter/material.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';

class PasswordDesign extends StatelessWidget {
    final TextEditingController passController;

 const PasswordDesign({
    Key? key,
    required this.passController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passController,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.left,
      obscureText: true,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: black, fontSize: 20),

        filled: true,
        fillColor: pink,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
         contentPadding: PageDesign.contentPadding // تحديد حجم الزر
      ),
      style: PageDesign.inputTextStyle.copyWith(fontSize: 18.0),
      textDirection: TextDirection.ltr,
    );
  }
}
