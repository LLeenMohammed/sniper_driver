import 'package:flutter/material.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/signup_name.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PageDesign myPageDesign = PageDesign(
    header: "",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo.png",
                width: 300,
              ),
              const SizedBox(height: 40),
              const Text(
                "أهلا بشريك النجاح!",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'arial',
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              RichTextContent(),
              //     const Text("انضم إلينا لتجربة القيادة بأمان وراحة، مع فرص ربح متميزة. نحن هنا لدعمك في كل خطوة على الطريق.", style: TextStyle(
              // fontSize: 22,
              // fontFamily: 'arial',
              // color: black,),textAlign: TextAlign.center,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "هل لديك حساب؟",
                    style: TextStyle(fontSize: 20, color: black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
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
              ),
              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkPurple,
                  fixedSize: const Size(320, 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpName();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myPageDesign.buildText(text: "حساب جديد", coloring: white),
                    const SizedBox(
                        width: 8), // Add some spacing between text and icon
                  ],
                ),
                // child: buildText(text: buttonText, coloring: white),
              ),
              const SizedBox(
                height: 20,
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return const LogInScreen();
              //         },
              //       ),
              //     );
              //   },
              //   child: myPageDesign.buildText(
              //     text: "أو يمكنك إجراء مشاوريك مع SNIPER",
              //     coloring: darkPurple,
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "أو يمكنك إجراء مشاوريك مع ",
                    style: TextStyle(
                        fontSize: 20,
                        color: black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            ///// add new screen
                            return const LogInScreen();
                         //   return const Introduction();
                          },
                        ),
                      );
                    },
                    child: myPageDesign.buildText(
                      text: "SNIPER",
                      decorLine: TextDecoration.underline,
                      coloring: darkPurple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RichTextContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
            fontSize: 22,
            fontFamily: 'arial',
            color: black,
            fontWeight: FontWeight.bold),
        children: [
          TextSpan(text: "مرحبًا بك في ", style: TextStyle(fontSize: 23)),
          TextSpan(
            text: "SNIPER",
            style: TextStyle(
              fontSize: 22,
              color: darkPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: " رفيقك الجديد.\n", style: TextStyle(fontSize: 23)),
          TextSpan(text: "انضم إلينا لتجربة القيادة بأمان وراحة، \n"),
          TextSpan(text: "مع فرص ربح متميزة. نحن هنا لدعمك\n"),
          TextSpan(text: "في كل خطوة على الطريق. \n"),
        ],
      ),
    );
  }
}
