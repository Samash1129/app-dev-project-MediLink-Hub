import 'package:app_dev_project_medilink_app/models/firstAid/first_aid_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirstAid {
  static Future<List<FirstAidModel>> getFirstAid() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('firstAid').get();

    return snapshot.docs
        .map((document) => FirstAidModel.fromJson(document.data()))
        .toList();
  }
}
