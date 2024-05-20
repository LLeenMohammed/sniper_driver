import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/mainScreen.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/signup_gender.dart';
class AddCarDetails{
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
  Future updateCarliscence(String id,File carlisence,File Driverlisence,String phonenumber,String password,context) async {
     CollectionReference users = FirebaseFirestore.instance.collection('user');
    final storage = FirebaseStorage.instance.ref("images/${id.toString()}/carlisence");
    final storage2 = FirebaseStorage.instance.ref("images/${id.toString()}/Driverlisence");
        await storage.putFile(carlisence);
         storage.getDownloadURL().then((value){
          print(value);
           users.doc(id).update({
              "carlisence" : '${value.toString()}',
              }).then((_) {
                    print("storeeeeeeeeeeeed"); 
                })
            .catchError((error) => print(error));
        });

        await storage2.putFile(Driverlisence);
         storage2.getDownloadURL().then((value){
          print(value);
           users.doc(id).update({
              "Driverlisence" : '${value.toString()}',
              }).then((_) {
                     Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return  SignUpGender(phonenumber:phonenumber, myid:id, passsword: password,);
                              },
                            ),
                          );
                    print("storeeeeeeeeeeeed"); 
                })
            .catchError((error) => print(error));
        });
       
     }
    
    }
    
  