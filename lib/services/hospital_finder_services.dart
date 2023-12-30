import 'package:app_dev_project_medilink_app/models/hospital/hospital_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHospital {
  static Future<List<HospitalModel>> getHospital() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('hospitals').get();

    return snapshot.docs
        .map((document) => HospitalModel.fromJson(document.data()))
        .toList();
  }
}
