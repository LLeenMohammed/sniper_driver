import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/screen/AcceptedRequest.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';

class UpdateReuestStatusController{
  Future updateRequestStatus(String id,String status,context) async {
     CollectionReference users = FirebaseFirestore.instance.collection('request');
    
         users.doc(id).update({
              "status" : '$status',
              "driver_id" : '$myid',
              "driver_name" : '$myname',
              }).then((_) {
                
                Navigator.push(context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                          return AcceptedRequest();
                                            }));
                
                })
            .catchError((error) => print(error));
            CollectionReference request = FirebaseFirestore.instance.collection('requestchild');
    
         request.doc(id).update({
              "status" : '$status',
              "driver_id" : '$myid',
              "driver_name" : '$myname',
              }).then((_) {
                
                Navigator.push(context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                          return AcceptedRequest();
                                            }));
                
                })
            .catchError((error) => print(error));
     }

     Future updateRequestStatusChild(String id,String status,context) async {
     CollectionReference users = FirebaseFirestore.instance.collection('requestchild');
    
         users.doc(id).update({
              "status" : '$status',
              }).then((_) {
                
                Navigator.push(context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                          return AcceptedRequest();
                                            }));
                
                })
            .catchError((error) => print(error));
     }
    
    }
    
  