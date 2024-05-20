import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_inf.dart';
LoginController _loginController=LoginController();
class AddGenderDetails{
  Future updategender(String id,String gender,String phonenumber,String passsword,context) async {
     CollectionReference users = FirebaseFirestore.instance.collection('user');
    
         users.doc(id).update({
              "gender" : '$gender',
              }).then((_) {
                print("sss");
                Navigator.of(context).push(
                MaterialPageRoute(
                              builder: (context) {
                                return  UploadInf(phonrnumber:phonenumber, id:id, password: passsword,);
                              },
                            ));
                })
            .catchError((error) => print(error));
     }
    
    }
    
  