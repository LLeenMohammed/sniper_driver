import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/mainScreen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/signup_name.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/password_design.dart';
import 'package:sniperdriver/widgets/phone_design.dart';
import 'package:sniperdriver/widgets/page_design.dart';
import 'package:sniperdriver/widgets/color.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}
LoginController _loginController=LoginController();
class _LogInScreenState extends State<LogInScreen> {
  TextEditingController phoneText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  //design header
  PageDesign myPageDesign = PageDesign(
    header: "تسجيل دخول السائق",
  );

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
              myPageDesign.buildHeader(100.0),
              myPageDesign.buildDivider(90),
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
                          text: "رقم الجوال:",
                        ),
                        const SizedBox(height: 8),
                        ButtonDesign(
                          nameController: phoneText,
                          hintStyle: TextStyle(color: grey, fontSize: 18),
                          hintText: "05XXXXXXXX",
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                          text: "كلمة السر:",
                        ),
                        const SizedBox(height: 8),
                        PasswordDesign(passController: passwordText,),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Column(
                      children: [
                        myPageDesign.buildElevatedButton(
                          buttonText: "تسجيل الدخول",
                          onPressed: () {
                            _loginController.checkIfUserExist(phoneText.text, passwordText.text, "driver", context);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: myPageDesign.buildText(text: "نسيت كلمة المرور؟")),
              const SizedBox(
                height: 10,
              ),
              myPageDesign.buildText(text: "_________أو_________"),
              const SizedBox(height: 40),
              myPageDesign.buildOutlinedButton(
                buttonText: "إنشاء حساب",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpName();
                      },
                    ),
                  );
                },
                buttonColor: darkPurple,
                textColor: darkPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
