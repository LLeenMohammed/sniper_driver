import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sniperdriver/controller/addgendertodriver.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_car_inf.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';
// ... (imports)

class SignUpGender extends StatefulWidget {
  final String myid;
  final String phonenumber;
  final String passsword;
  const SignUpGender({super.key, required this.myid, required this.phonenumber, required this.passsword});

  @override
  State<SignUpGender> createState() => _SignUpGenderState();
}
AddGenderDetails _addGenderDetails=AddGenderDetails();
class _SignUpGenderState extends State<SignUpGender> {
  PageDesign myPageDesign = PageDesign(
    header: "اختر الطريقة التي تفضلها  مع",
  );
  Color buttonColor1 = backgroundColor;
  Color buttonColor2 = backgroundColor;
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarDesign.buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              myPageDesign.buildHeader(20),
              const Text(
                "SNIPER",
                style: TextStyle(
                  color: darkPurple,
                  fontSize: 30,
                  fontFamily: 'arial',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              myPageDesign.buildDivider(20),
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
                          text: "** ملاحظة ",
                          coloring: darkPurple,
                        ),
                        myPageDesign.buildText(
                          text:
                              "يجب ألا يقل عمرك عن 20 عاماً وأن تكون لديك رخصة قيادة وسيارتك بحالة جيدة وعمرها أقل من 5 سنوات",
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        clickButton(
                          text: "مواطن (ذكر)",
                          onPressedCallback: () {
                            setState(() {
                              isButton1Pressed = !isButton1Pressed;
                              buttonColor1 =
                                  isButton1Pressed ? pink : backgroundColor;

                              // Reset the color and state of the other button
                              isButton2Pressed = false;
                              buttonColor2 = backgroundColor;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        clickButton(
                          text: "مواطنة (أنثى)",
                          onPressedCallback: () {
                            setState(() {
                              isButton2Pressed = !isButton2Pressed;
                              buttonColor2 =
                                  isButton2Pressed ? pink : backgroundColor;

                              // Reset the color and state of the other button
                              isButton1Pressed = false;
                              buttonColor1 = backgroundColor;

                              // Display the dialog
                              dialog1(context);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 140,
                        ),
                        myPageDesign.buildElevatedButton(
                          buttonText: "تكملة",
                          onPressed: () {
                            print("ssssssss");
                            _addGenderDetails.updategender(widget.myid, isButton1Pressed?"male":"female", widget.phonenumber, widget.passsword, context);
                          },
                          icon: Icons.arrow_back,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton clickButton({
    required String text,
    VoidCallback? onPressedCallback,
  }) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          onPressedCallback?.call();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            text == "مواطن (ذكر)" ? buttonColor1 : buttonColor2,
        side: const BorderSide(color: darkPurple),
        fixedSize: const Size(390, 50),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: myPageDesign.buildText(
        text: text,
        coloring: darkPurple,
      ),
    );
  }

  Future<void> dialog1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'أهلا بشريكة النجاح ..!',
            style: TextStyle(fontWeight: FontWeight.bold, color: darkPurple),
          ),
          content: myPageDesign.buildText(
            text:
                "اذا كان عمرك فوق الثلاثين فأنت مهيئة لتوصيل الأطفال! هل تريدين إضافة هذه الخدمة؟",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: myPageDesign.buildText(
                text: "نعم",
                coloring: darkPurple,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: myPageDesign.buildText(
                text: "لا",
                coloring: darkPurple,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
