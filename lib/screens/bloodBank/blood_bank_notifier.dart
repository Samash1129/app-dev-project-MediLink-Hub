import 'dart:developer';

import 'package:app_dev_project_medilink_app/models/bloodBank/blood_bank_model.dart';
import 'package:app_dev_project_medilink_app/services/blood_bank_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bloodBankProvider = FutureProvider<List<BloodBankModel>>((ref) async {
  try {
    final List<BloodBankModel> bloodBankList =
        await FirebaseBloodBank.getBloodBank();

        log("BloodBanks: " + bloodBankList.toString());

    return bloodBankList;
  } catch (e) {
    // You might want to handle errors more gracefully
    throw Exception('Failed to fetch blood banks: $e');
  }
});




