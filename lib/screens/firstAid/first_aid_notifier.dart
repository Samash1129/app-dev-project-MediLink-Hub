import 'dart:developer';

import 'package:app_dev_project_medilink_app/models/firstAid/first_aid_model.dart';
import 'package:app_dev_project_medilink_app/services/first_aid_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firstAidProvider = FutureProvider<List<FirstAidModel>>((ref) async {
  try {
    final List<FirstAidModel> firstAidList =
        await FirebaseFirstAid.getFirstAid();

        log("FirstAids: $firstAidList");

    return firstAidList;
  } catch (e) {
    // You might want to handle errors more gracefully
    throw Exception('Failed to fetch first aids: $e');
  }
});




