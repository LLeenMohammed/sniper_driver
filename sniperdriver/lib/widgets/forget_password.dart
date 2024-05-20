import 'package:flutter/material.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/widgets/color.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  get myPageDesign => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "هل لديك حساب؟",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  // Replace LogInScreen() with your desired screen widget.
                  return const LogInScreen();
                },
              ),
            );
          },
          child: myPageDesign.buildText(
            text: "تسجيل الدخول",
            decorLine: TextDecoration.underline,
            coloring: darkPurple,
          ),
        ),
      ],
    );
  }
}
