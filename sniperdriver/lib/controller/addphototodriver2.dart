import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/mainScreen.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';

import 'package:sniperdriver/screen/sign_un_screen.dart/signup_gender.dart';
class AddCarDetails2{
  addphoto(File myimage,name,) async {
    String imageurl="";
    final storage = FirebaseStorage.instance.ref("images/$name$myid");
    print(myimage.path);
        await storage.putFile(myimage);
         storage.getDownloadURL().then((value){
          print(value);
          imageurl=value.toString();
        });
        return imageurl;
  }
  LoginController _loginController=LoginController();
  Future updateCarliscence(String id,File carlisence,File Driverlisence,String phonenumber,String password,String N_id,context) async {
     CollectionReference users = FirebaseFirestore.instance.collection('user');
    final storage = FirebaseStorage.instance.ref("images/${id.toString()}/helth");
    final storage2 = FirebaseStorage.instance.ref("images/${id.toString()}/report");
        await storage.putFile(carlisence);
         storage.getDownloadURL().then((value){
          print(value);
           users.doc(id).update({
              "helth" : '${value.toString()}',
              'N_id':N_id
              }).then((_) {
                    print("storeeeeeeeeeeeed"); 
                })
            .catchError((error) => print(error));
        });

        await storage2.putFile(Driverlisence);
         storage2.getDownloadURL().then((value){
          print(value);
           users.doc(id).update({
              "report" : '${value.toString()}',
              }).then((_) {
                            _loginController.checkIfUserExist(phonenumber, password, "driver", context);
                
                    print("storeeeeeeeeeeeed"); 
                })
            .catchError((error) => print(error));
        });
       
     }
    
    }
    
  