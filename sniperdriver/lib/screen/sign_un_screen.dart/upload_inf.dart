import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniperdriver/controller/addphototodriver2.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_Inf_2.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';
import 'package:sniperdriver/widgets/phone_design.dart';
import 'package:sniperdriver/widgets/page_design.dart';

class UploadInf extends StatefulWidget {
  final String phonrnumber;
  final String password;
  final String id;
  const UploadInf({super.key, required this.phonrnumber, required this.password, required this.id});

  @override
  State<UploadInf> createState() => _UploadInfState();
}
bool agreeToTerms=false;
XFile? pickedFile;
  bool isImage = false;

  XFile? pickedFile2;
  bool isImage2 = false;

  AddCarDetails2 _addCarDetails2=AddCarDetails2();
TextEditingController idcontroller=TextEditingController();
class _UploadInfState extends State<UploadInf> {
  PageDesign myPageDesign = PageDesign(
    header: "مرحبا بك ..!",
  );
  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarDesign.buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(children: [
            myPageDesign.buildHeader(190.0),
            myPageDesign.buildDivider(170),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myPageDesign.buildText(
                              text: "رقم الهوية:",
                            ),
                            const SizedBox(height: 8),
                             ButtonDesign(
                              hintStyle: TextStyle(color: grey, fontSize: 18),
                              hintText: "11XXXXXXXX",
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.left, nameController: idcontroller,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            myPageDesign.buildText(
                              text: "رفع معلومات تقريرنجم:",
                            ),
                            const SizedBox(height: 8),
                            isImage?
                     Image.file(
                          File(pickedFile!.path) ,
                           fit: BoxFit.cover,
                           height: height/5,
                            width: width/2.5,
                            ):
          
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pink,
                            fixedSize: const Size(380, 120),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: darkPurple, width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            _getFromGallery1();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.file_upload_outlined,
                                size: 50.0,
                                color: white,
                              ),
                              const SizedBox(width: 8),
                              myPageDesign.buildText(
                                text: "اضغط هنا للرفع",
                                coloring: black,
                              ),
                            ],
                          ),
                        ),
                            const SizedBox(height: 10),
                            myPageDesign.buildText(
                              text: "رفع معلومات السجل الصحي:",
                            ),
                            const SizedBox(height: 8),
                          isImage2?
                            Image.file(
                          File(pickedFile2!.path) ,
                           fit: BoxFit.cover,
                           height: height/5,
                            width: width/2.5,
                            ):
                            ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pink,
                            fixedSize: const Size(380, 120),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: darkPurple, width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            _getFromGallery2();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.file_upload_outlined,
                                size: 50.0,
                                color: white,
                              ),
                              const SizedBox(width: 8),
                              myPageDesign.buildText(
                                text: "اضغط هنا للرفع",
                                coloring: black,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: agreeToTerms,
                              onChanged: (value) {
                                setState(() {
                                  agreeToTerms = value ?? false;
                                });
                              },
                            ),
                            myPageDesign.buildText(
                                text: "أوافق على ", coloring: black),
                            myPageDesign.buildText(
                                text: "الشروط و الأحكام", coloring: darkPurple)
                          ],
                        ),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      myPageDesign.buildElevatedButton(
                        buttonText: "إنشاء حساب",
                        onPressed: () {
                          if (agreeToTerms) {
                            _addCarDetails2.updateCarliscence(widget.id, File(pickedFile!.path), File(pickedFile2!.path), widget.phonrnumber, widget.password,idcontroller.text, context);
                       
                          } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Dialog(
                                  child: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check),
                                          Text(
                                              "يجب الموافقة على الشروط لتكملة التسجيل بنجاح"),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                           },
                       
                      )
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
  _getFromGallery1() async {
    pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        isImage = true;
      });
    }
  }
  _getFromGallery2() async {
    pickedFile2 = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile2 != null) {
      setState(() {
        isImage2 = true;
      });
    }
  }
}
