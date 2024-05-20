import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteQUestion{
  Future deleteQuestion(String id,context) async {
     CollectionReference users = FirebaseFirestore.instance.collection('question');
    await users.doc(id).delete().then((_) {
      AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.bottomSlide,
                  title: 'detletd',
                  btnOkOnPress: () {},
                )..show();
    })
    .catchError((error) => false);
  }
}