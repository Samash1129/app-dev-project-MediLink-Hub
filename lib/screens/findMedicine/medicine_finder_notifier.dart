import 'dart:developer';

import 'package:app_dev_project_medilink_app/models/medicine/medicine_model.dart';
import 'package:app_dev_project_medilink_app/services/medicine_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final medicineProvider = FutureProvider<List<MedicineModel>>((ref) async {
  try {
    final List<MedicineModel> medicineList =
        await FirebaseMedicine.getMedicine();

        log("Medicines: $medicineList");

    return medicineList;
  } catch (e) {
    // You might want to handle errors more gracefully
    throw Exception('Failed to fetch blood banks: $e');
  }
});




