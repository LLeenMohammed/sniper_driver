
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sniperdriver/mainScreen.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/upload_car_inf.dart';
late String myname="";
late String myid="";
late String myphone="";
late String myemail="";
late String cartype="";
late String mygender="";

late String carlisence="";
late String color="";
late String model="";

late String mynumber="";
late String Driverlisence="";
late String report="";

late String helth="";
late String N_id="";
class LoginController{
  
  checkIfUserExist(String username,String password,String type,context){
    FirebaseFirestore.instance
  .collection('user')
  .where('phone', isEqualTo: username).where('password', isEqualTo: password).where('type', isEqualTo: type)
  .get()
  .then((value) {
    print(value.docs);
    print(value.docs != []);
      if(value.docs.isNotEmpty){
        value.docs.forEach((element) {
          myname=element['name'];
          myphone= element['phone'];
          cartype=element['cartype'];
          mygender=element['gender'];
          Driverlisence=element['Driverlisence'];
          carlisence=element['carlisence'];
          color= element['color'];
          model=element['model'];
          mynumber=element['number'];
          color= element['color'];
          report=element['report'];
          helth=element['helth'];
          N_id=element['N_id'];
          if (element["type"].toString()=="driver") {
             Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                                  return MainScreenState();
                         //     return const MainScreenState();
                            }));
          } else if(element["type"].toString()=="user"){
            // Navigator.push(context,
            //             MaterialPageRoute(builder: (BuildContext context) {
            //           return ScanStudents();
            //             }));
          }
        
         
          _save(element.id,element['name']);
          // isadded=element['isadded'];
        });
        
                 
      }else{
        return AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: 'user didnt exist',
        btnOkOnPress: () {},
      )..show();
      }
  },);
  }



  _save(String user_id, String name)async {
    final prefs = await SharedPreferences.getInstance();

    final key_user_id = 'user_id';
    final value_user_id = user_id;
    prefs.setString(key_user_id, value_user_id);

   final key_name = 'name';
    final value_name = name;
    prefs.setString(key_name, value_name);


   printmydata();
  }
    

  signup(String type,String name,String phonenumber,String password,String gender,context) async {
    print("start");
  await  FirebaseFirestore.instance
  .collection('user')
  .where('phone', isEqualTo: phonenumber).where('type', isEqualTo: type)
  .get()
  .then((value) {
       if(value.docs.isEmpty){

        
        CollectionReference users = FirebaseFirestore.instance.collection('user');
      // Call the user's CollectionReference to add a new user
                                    users.add({
                                      'name':name.toString(),
                                      'type':type.toString(),
                                      'phone':phonenumber.toString(),
                                      'password':password,
                                      'gender':gender
                                    })
                                    .then((value) {
                                      print("ssss"+value.id.toString());
                                       Navigator.push(context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                          return UploadCarInf(user_id: value.id.toString(), phonenumber:phonenumber, password: password,);
                                            }));
                                    })
                                    .catchError((error) {
                                      return false;
                                    });

       }else{
         return AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: 'تم تسجيل رقم الهاتف مسبقا',
        btnOkOnPress: () {},
      )..show();
       }
    },);
  


  } 



}

printmydata() async {
  final prefs = await SharedPreferences.getInstance();
  
        final key_user_id = 'user_id';
        final valueuderidtoken = prefs.get(key_user_id);
         myid=valueuderidtoken.toString();
        print(valueuderidtoken);

        final key_name = 'name';
        final valueudername = prefs.get(key_name);
        myname=valueudername.toString();
        print(valueudername);
}
getuserid() async {
  final prefs = await SharedPreferences.getInstance();
  
        final key_user_id = 'user_id';
        return prefs.get(key_user_id);
}
getname() async {
  final prefs = await SharedPreferences.getInstance();
  
        final key_user_id = 'name';
        return prefs.get(key_user_id);
}







