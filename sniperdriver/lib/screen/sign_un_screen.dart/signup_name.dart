import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_car_inf.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';
import 'package:sniperdriver/widgets/password_design.dart';
import 'package:sniperdriver/widgets/phone_design.dart';
import 'package:sniperdriver/widgets/progress_dialog.dart';

class SignUpName extends StatefulWidget {
  const SignUpName({super.key});

  @override
  State<SignUpName> createState() => _SignUpNameState();
}
enum Gender { male, female }
 Gender _selectedGender = Gender.male;
LoginController _loginController=LoginController();
class _SignUpNameState extends State<SignUpName> {
  TextEditingController nameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  validationForm() {
  if (nameText.text.length < 3) {


    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Text("الاسم تلت محارف"),
      );
    },);






    Fluttertoast.showToast(
      msg: "يجب أن يكون الاسم على الأقل 3 حروف",
    );
  } else if (phoneText.text.length < 10) {
    Fluttertoast.showToast(
      msg: "الرقم غير صحيح",
    );
  } else if (passwordText.text.length < 6) {
    Fluttertoast.showToast(
      
      msg: "يجب أن تحتوي كلمة السر على الأقل على 6 أحرف أو أرقام",
    );
  } else {
    return true;
  }
}





  PageDesign myPageDesign = PageDesign(
    header: "عرفنا باسمك",
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
              myPageDesign.buildHeader(190.0),
              myPageDesign.buildDivider(170),
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
                          text: "الاسم الأول والأخير:",
                        ),
                        const SizedBox(height: 8),
                        ButtonDesign(
                          nameController: nameText,
                          hintStyle: const TextStyle(color: grey, fontSize: 18),
                          hintText: "ريما العمودي",
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.right,
                          
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
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
                          hintStyle: const TextStyle(color: grey, fontSize: 18),
                          hintText: "05XXXXXXXX",
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                          text: "كلمة السر:",
                        ),
                        const SizedBox(height: 8),
                        PasswordDesign(
                          passController: passwordText,
                        ),
                      ],
                    ),
                    //  ListTile(
                    //         title: Text('Male'),
                    //         leading: Radio(
                    //           value: Gender.male,
                    //           groupValue: _selectedGender,
                    //           onChanged: ( value) {
                    //             setState(() {
                    //               _selectedGender = value!;
                    //             });
                    //           },
                    //         ),
                    //       ),
                    //       ListTile(
                    //         title: Text('Female'),
                    //         leading: Radio(
                    //           value: Gender.female,
                    //           groupValue: _selectedGender,
                    //           onChanged: ( value) {
                    //             setState(() {
                    //               _selectedGender = value!;
                    //             });
                    //           },
                    //         ),
                    //       ),
                          // SizedBox(height: 16.0),
                          // Text(
                          //   'Selected Gender: ${_selectedGender == Gender.male ? "Male" : "Female"}',
                          //   style: TextStyle(fontSize: 16.0),
                          // ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        myPageDesign.buildElevatedButton(
                          buttonText: "تكملة",
                          onPressed: () {
                            if (validationForm()) {
                              _loginController.signup("driver", nameText.text, phoneText.text, passwordText.text,"",context).then((value){
                                    if (value) {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       //  return const SignUpRegion();
                                      //       return const UploadCarInf();
                                            
                                      //     },
                                      //   ),
                                      // );
                                    }
                                    return AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.bottomSlide,
                                            title: 'يوجد خطأ',
                                            btnOkOnPress: () {},
                                          )..show();
                                  });
                            
                            }
                                // _loginController.signup("driver", nameText.text, phoneText.text, passwordText.text, context);
                            
                          },
                          icon: Icons.arrow_back,
                        )
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//   void phoneAuth () async{
//     await FirebaseAuth.instance.verifyPhoneNumber(
//   phoneNumber: '+44 7123 123 456',
//   verificationCompleted: (PhoneAuthCredential credential) {},
//   verificationFailed: (FirebaseAuthException e) {},
//   codeSent: (String verificationId, int? resendToken) {},
//   codeAutoRetrievalTimeout: (String verificationId) {},
// );
//   }