
import 'package:flutter/material.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';

class ButtonDesign extends StatelessWidget {
  const ButtonDesign({
    this.keyboardType,
    this.hintText,
    this.hintStyle,
    this.textAlign,
    required this.nameController,
  });

  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.left,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        filled: true,
        fillColor: pink,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: PageDesign.contentPadding,
      ),
      style: PageDesign.inputTextStyle,
    );
  }
}


