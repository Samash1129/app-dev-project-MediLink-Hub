import 'package:app_dev_project_medilink_app/models/doctor/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDoctor {
  static Future<List<DoctorModel>> getDoctor() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();

    return snapshot.docs
        .map((document) => DoctorModel.fromJson(document.data()))
        .toList();
  }
}
