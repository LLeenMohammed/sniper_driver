//import 'dart:ffi' as ffi;
import 'package:flutter/material.dart';
import 'package:sniperdriver/widgets/color.dart';

class PageDesign {
   Color buttonColor = Colors.blue;
  final String header;

  PageDesign({
    required this.header,
  });

  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    vertical: 14.0,
    horizontal: 15.0,
  );

  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 15.0,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

// header design
  Widget buildHeader(double leftPadding) {
    return Container(
      padding: EdgeInsets.only(left: leftPadding),
      child: Text(
        header,
        style: const TextStyle(
          fontSize: 30,
          fontFamily: 'arial',
          color: black,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

// line after header
  Widget buildDivider(
    double? endIndent,
  ) {
    return Divider(
      color: darkPurple,
      thickness: 2,
      height: 10,
      indent: 10,
      endIndent: endIndent ?? 90,
    );
  }

  //Text
  Widget buildText({
    required String text,
    TextDecoration decorLine = TextDecoration.none,
    Color coloring = Colors.black, // قيمة افتراضية هنا
  }) {
    return _buildTextWidget(
      text: text,
      decorLine: decorLine,
      coloring: coloring,
    );
  }

  Widget _buildTextWidget({
    required String text,
    TextDecoration decorLine = TextDecoration.none,
    Color coloring = Colors.black, // قيمة افتراضية هنا
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: coloring,
          decoration: decorLine),
      textAlign: TextAlign.right,
    );
  }

  // elevator button
  Widget buildElevatedButton({
    required String buttonText,
    required VoidCallback onPressed,
   // required Color buttonColor,
    Color textColor = white,
    IconData? icon, // Make the icon optional
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPurple,
        fixedSize: const Size(380, 50),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildText(text: buttonText, coloring: white),
          const SizedBox(width: 8), // Add some spacing between text and icon
          if (icon != null) Icon(icon, color: textColor),
        ],
      ),
      // child: buildText(text: buttonText, coloring: white),
    );
  }



  Widget buildOutlinedButton({
    required String buttonText,
    required VoidCallback onPressed,
    Color buttonColor = darkPurple,
    Color textColor = darkPurple,

    //IconData? icon, // Make the icon optional
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: buttonColor,
        fixedSize: const Size(323, 50),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(
          color: darkPurple,
        ),
      ),

      onPressed: () {
        onPressed();
      },
      child: buildText(text: buttonText, coloring: textColor),
      // const SizedBox(width: 8), // Add some spacing between text and icon
      //  if (icon != null) Icon(icon, color: textColor),
    );

    
  }

  // Widget buildDropdownButton({
  //   required List<String> items,
  //   required String? selectedItem,
  //   required void Function(String?) onChanged,
  //   Color buttonColor = darkPurple,
  //   //Color textColor = darkPurple,
  // }) {
  //   return DropdownButton(
  //     items: items
  //         .map((e) => DropdownMenuItem(
  //               child: buildText(text: e), // استخدم نفس نصائح الزر
  //               value: e,
  //             ))
  //         .toList(),
  //     onChanged: onChanged,
  //     value: selectedItem,

  //   );
  // }
}
