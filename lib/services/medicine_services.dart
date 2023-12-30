import 'package:app_dev_project_medilink_app/models/medicine/medicine_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMedicine {
  static Future<List<MedicineModel>> getMedicine() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('medicines').get();

    return snapshot.docs
        .map((document) => MedicineModel.fromJson(document.data()))
        .toList();
  }
}
