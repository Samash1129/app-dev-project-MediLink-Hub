import 'dart:developer';

import 'package:app_dev_project_medilink_app/models/hospital/hospital_model.dart';
import 'package:app_dev_project_medilink_app/services/hospital_finder_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hospitalProvider = FutureProvider<List<HospitalModel>>((ref) async {
  try {
    final List<HospitalModel> hospitalList =
        await FirebaseHospital.getHospital();

        log("Hospitals: $hospitalList");

    return hospitalList;
  } catch (e) {
    // You might want to handle errors more gracefully
    throw Exception('Failed to fetch Hospital: $e');
  }
});




