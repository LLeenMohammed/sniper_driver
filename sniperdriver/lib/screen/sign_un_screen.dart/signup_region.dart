import 'package:flutter/material.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/signup_gender.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';

class SignUpRegion extends StatefulWidget {
  final String password;
  final String phonenumber;
  final String myid;
  const SignUpRegion({super.key, required this.password, required this.phonenumber, required this.myid});

  @override
  State<SignUpRegion> createState() => _SignUpRegionState();
}

class _SignUpRegionState extends State<SignUpRegion> {
  PageDesign myPageDesign = PageDesign(
    header: "حقق الدخل مع SNIPER",
  );
  String? selectedItem;
  Color buttonColor = backgroundColor;
  bool isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBarDesign.buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.centerRight,
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(children: [
                myPageDesign.buildHeader(60),
                //SNIPER PURPLE ***************************
                myPageDesign.buildDivider(60),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myPageDesign.buildText(
                              text: "الرجاء اختيار المنطقة المناسبة لك",
                            ),
                            const SizedBox(height: 8),

                            clickButton(),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                                "بالمتابعة, أوافق على تواصل SNIPER معي عبر الهاتف أو الرسائل النصية القصيرة SMS ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grey,
                                )),
                            const SizedBox(
                              height: 280,
                            ),
                            myPageDesign.buildElevatedButton(
                              buttonText: "تكملة",
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return  SignUpGender(myid: widget.myid, phonenumber: widget.phonenumber, passsword: widget.password);
                                    },
                                  ),
                                );
                              },
                              icon: Icons.arrow_back,
                            )
                          ],
                        ),
                      ],
                    )),
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
              ])),
        ));
  }

  ElevatedButton clickButton() {
    return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (isButtonPressed) {
                                    buttonColor = backgroundColor;
                                  } else {
                                    buttonColor = pink;
                                  }
                                  isButtonPressed = !isButtonPressed;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                side: const BorderSide(color: darkPurple),
                                fixedSize: const Size(390, 50),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: myPageDesign.buildText(
                                text: "جدة",
                              ));
  }
}
