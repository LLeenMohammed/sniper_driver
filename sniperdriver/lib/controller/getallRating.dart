import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/model/RateModel.dart';
import 'package:sniperdriver/model/requestChildModel.dart';
import 'package:sniperdriver/model/requestmodel.dart';

class GetAllRatringController{
  getallRateing() async {
    List <RateModel> users=[];
    await FirebaseFirestore.instance
    .collection('rate').where('driver_id', isEqualTo:myid)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc.id);
          users.add(RateModel(id: doc.id, rate:doc['rate'] ));
            // print(doc["email"]);
        });
    });
    return users;
  }

  getallRequestchild() async {
    List <Request_model_Child> users=[];
    await FirebaseFirestore.instance
    .collection('requestchild').where('driver_id', isEqualTo:myid)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc.id);
          users.add(Request_model_Child(id: doc.id, date: doc['date'], from: doc['from'], lat: doc['lat'], lng: doc['lng'], 
          status: doc['status'], to: doc['to'], user_id: doc['user_id'], driver_id: doc['driver_id'], driver_name: doc['driver_name'], childname:  doc['childname'], childnumber:  doc['childnumber'], childage:  doc['childage']));
            // print(doc["email"]);
        });
    });
    return users;
  }



  getallbydriver() async {
    List <Request_model> users=[];
    await FirebaseFirestore.instance
    .collection('request').where('driver_id', isEqualTo:myid)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc.id);
          users.add(Request_model(id: doc.id, date: doc['date'], from: doc['from'], lat: doc['lat'], lng: doc['lng'], 
          status: doc['status'], to: doc['to'], user_id: doc['user_id'], driver_id: doc['driver_id'], driver_name: doc['driver_name']));
            // print(doc["email"]);
        });
    });
     await FirebaseFirestore.instance
    .collection('requestchild').where('driver_id', isEqualTo:myid)
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc.id);
          users.add(Request_model(id: doc.id, date: doc['date'], from: doc['from'], lat: doc['lat'], lng: doc['lng'], 
          status: doc['status'], to: doc['to'], user_id: doc['user_id'], driver_id: doc['driver_id'], driver_name: doc['driver_name']));
            // print(doc["email"]);
        });
    });
    return users;
  }

}