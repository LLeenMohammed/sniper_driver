import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_Inf_2.dart';
LoginController _loginController=LoginController();
class AddCarInfo{
  Future updateCar(String id,String type,String number,String color,String model,String phonenumber,String passsword,context) async {
     CollectionReference users = FirebaseFirestore.instance.collection('user');
      
         users.doc(id).update({
              "cartype" : '$type',
              "number" : '$number',
              "color" : '$color',
              "model" : '$model',
              }).then((_) {
                print(phonenumber);
                print(passsword);
                // _loginController.checkIfUserExist(phonenumber, passsword, "driver", context);
                Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return  UploadInf2( my_id:id,phonenumber:phonenumber, passsword: passsword,);
                              },
                            ),
                          );
                })
            .catchError((error) => print(error));
     }
    
    }
    
  