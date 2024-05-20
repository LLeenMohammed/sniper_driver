import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniperdriver/controller/addcarinfo.dart';
import 'package:sniperdriver/controller/addphototodriver.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_Inf_2.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_inf.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';
import 'package:sniperdriver/widgets/phone_design.dart';

class UploadCarInf extends StatefulWidget {
  final String phonenumber;
  final String password;
  final String user_id;
  const UploadCarInf({super.key, required this.user_id, required this.phonenumber, required this.password});

  @override
  State<UploadCarInf> createState() => _UploadCarInfState();
}
AddCarInfo _addCarDetails=AddCarInfo(); 
class _UploadCarInfState extends State<UploadCarInf> {
  TextEditingController carType = TextEditingController();
  TextEditingController carNumber = TextEditingController();
  TextEditingController carColor = TextEditingController();
  TextEditingController carModelNum = TextEditingController();

  validationForm(){
    if (carType.text.length < 5){
      Fluttertoast.showToast(
         msg: "يجب أن يحتوي نوع السيارة على  5 أحرف على الأقل",);
    }
    else if (carNumber.text.length < 7){
      Fluttertoast.showToast(
         msg: "الرجاء كتابة رقم السيارة الصححي ( الأحرف والأرقام)",);
    }
    else if (carModelNum.text.length >= 2010){
      Fluttertoast.showToast(
         msg: "يجب أن يكون موديل السيارة من 2010 أو اكثر ",);
    }else{
      return true;
    }
  }
  PageDesign myPageDesign = PageDesign(
    header: "معلومات السيارة",
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
          child: Column(children: [
            myPageDesign.buildHeader(150.0),
            myPageDesign.buildDivider(140),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myPageDesign.buildText(
                              text: "نوع السيارة:",
                            ),
                            const SizedBox(height: 8),
                             ButtonDesign(
                              nameController: carType,
                              hintStyle: TextStyle(color: grey, fontSize: 18),
                              hintText: "Honda CR-V ",
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            myPageDesign.buildText(
                              text: "رقم السيارة:",
                            ),
                            const SizedBox(height: 8),
                             ButtonDesign(
                              nameController: carNumber,
                              hintStyle: TextStyle(color: grey, fontSize: 18),
                              hintText: "5214 RAN",
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            myPageDesign.buildText(
                              text: "لون السيارة:",
                            ),
                            const SizedBox(height: 8),
                             ButtonDesign(
                              nameController: carColor,
                              hintStyle: TextStyle(color: grey, fontSize: 18),
                              hintText: "White",
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            myPageDesign.buildText(
                              text: "سنة موديل السيارة:",
                            ),
                            const SizedBox(height: 8),
                             ButtonDesign(
                              nameController: carModelNum,
                              hintStyle: TextStyle(color: grey, fontSize: 18),
                              hintText: "2020",
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            myPageDesign.buildElevatedButton(
                              buttonText: "تكملة",
                              onPressed: () {
                                
                                if (validationForm()) {
                                   Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                                  return UploadInf2(my_id: widget.user_id, phonenumber:widget.phonenumber, passsword:widget.password,);
                         //     return const MainScreenState();
                            }));
                                
                                  _addCarDetails.updateCar(widget.user_id, carType.text, carNumber.text, carColor.text, carModelNum.text,widget.phonenumber,widget.password, context);
                                }
                              },
                              icon: Icons.arrow_back,
                            )
                          ]),
                    ])),
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
          ]),
        ),
      ),
    );
  }
}
