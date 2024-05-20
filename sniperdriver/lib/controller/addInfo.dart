import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddInfoController {
  addInfo(String newinfo,context){
    print("start");
        CollectionReference users = FirebaseFirestore.instance.collection('info');
      // Call the user's CollectionReference to add a new user
                                    users.add({
                                      'newinfo':newinfo.toString(),
                                    })
                                    .then((value) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.bottomSlide,
                                            title: 'done',
                                            btnOkOnPress: () {},
                                          )..show();
                                    })
                                    .catchError((error) {
                                      print(error);
                                    });



  } 
}