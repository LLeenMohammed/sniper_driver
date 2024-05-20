import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sniperdriver/controller/addphototodriver.dart';
import 'package:sniperdriver/mainScreen.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';

class UploadInf2 extends StatefulWidget {
  final String my_id;
  final String phonenumber;
  final String passsword;
  const UploadInf2({Key? key, required this.my_id, required this.phonenumber, required this.passsword}) : super(key: key);

  @override
  State<UploadInf2> createState() => _UploadInfState();
}
AddCarDetails _addCarDetails=AddCarDetails();
XFile? pickedFile;
  bool isImage = false;

  XFile? pickedFile2;
  bool isImage2 = false;
class _UploadInfState extends State<UploadInf2> {
  PageDesign myPageDesign = PageDesign(header: "مرحبا بك ..!");
  bool agreeToTerms = false;

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
          child: Column(
            children: [
              myPageDesign.buildHeader(190.0),
              myPageDesign.buildDivider(170),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                          text: "رفع معلومات رخصة القيادة:",
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
                        const SizedBox(height: 40),
                        myPageDesign.buildText(
                          text: "رفع معلومات استمارة السيارة:",
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
                        const SizedBox(height: 20),
                        
                      ],
                    ),
                    const SizedBox(height: 20),
                    myPageDesign.buildElevatedButton(
                      buttonText: "تكملة",
                      onPressed: () {
                          _addCarDetails.updateCarliscence(widget.my_id,File(pickedFile!.path) , File(pickedFile2!.path),widget.phonenumber,widget.passsword, context);
 

                          
                      },
                       icon: Icons.arrow_back,
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
