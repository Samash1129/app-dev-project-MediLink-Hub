// ignore_for_file: use_build_context_synchronously

import 'package:app_dev_project_medilink_app/functions/doctor_finder_provider.dart';
import 'package:app_dev_project_medilink_app/functions/medicine_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Cards.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final searchTextProvider = Provider<String>((ref) {
  return ref.watch(searchControllerProvider).text;
});

final filteredMedicinesProvider =
    StateProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  final allMedicines = ref.watch(medicineFinderProvider);
  final searchText = ref.watch(searchControllerProvider).text;

  return allMedicines.when(
    data: (data) {
      // Filter based on the name
      final filteredMedicines = data.where((medicine) {
        final medicineMatch = medicine['name']
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase());
        return medicineMatch;
      }).toList();

      // Create a set to store unique formulas
      final Set<String> uniqueFormulas = {};

      // Iterate through the filtered medicines and add unique formulas to the set
      for (final medicine in filteredMedicines) {
        uniqueFormulas.add(medicine['formula'].toString().toLowerCase());
      }

      // Create a list to store the final result
      final List<Map<String, dynamic>> finalResult = [];

      // Iterate through the unique formulas and add all medicines with the same formula
      for (final formula in uniqueFormulas) {
        finalResult.addAll(data.where((medicine) {
          return medicine['formula'].toString().toLowerCase() == formula;
        }));
      }

      return finalResult;
    },
    loading: () => [], // Return an empty list while loading
    error: (error, stackTrace) => [], // Return an empty list on error
  );
});

class MedicineFinder extends ConsumerWidget {
  const MedicineFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final filteredMedicines = ref.watch(filteredMedicinesProvider);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back, color: Color(0xFFAF1212)),
                ),
              ),
              const Appbar(appbarHeading: 'Doctor Finder'),
            ],
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8, 8, 8),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          ref.refresh(filteredMedicinesProvider);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(100, 211, 211, 211),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(209, 211, 211, 211),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(100, 211, 211, 211),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: CustomButton(
                      text: 'Search',
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      radius: 5,
                      onPressed: () {
                        // You can implement search functionality here if needed
                        print('Search button pressed');
                      },
                      color: Colors.redAccent[700]!.withOpacity(1.0),
                      width: MediaQuery.of(context).size.width * 0.28,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: filteredMedicines.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox(
                      height: 10,
                    );
                  }
                  final Map<String, dynamic> medicine =
                      filteredMedicines[index - 1];
                  return CustomCard(
                    elevation: 0,
                    title: medicine['name'],
                    height: 100,
                    description: 'Formula: ${medicine['formula']}',
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
