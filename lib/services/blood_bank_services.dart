import 'package:app_dev_project_medilink_app/models/bloodBank/blood_bank_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBloodBank {
  static Future<List<BloodBankModel>> getBloodBank() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection(' bloodBanks').get();

    return snapshot.docs
        .map((document) => BloodBankModel.fromJson(document.data()))
        .toList();
  }
}
