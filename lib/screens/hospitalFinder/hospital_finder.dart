import 'package:app_dev_project_medilink_app/models/hospital/hospital_model.dart';
import 'package:app_dev_project_medilink_app/screens/hospitalFinder/hospital_finder_notifier.dart';
import 'package:flutter/material.dart';
import 'package:app_dev_project_medilink_app/widgets/appbar_widget.dart';
import 'package:app_dev_project_medilink_app/widgets/cards_widget.dart';
import 'package:app_dev_project_medilink_app/widgets/custom_button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final searchTextProvider = Provider<String>((ref) {
  return ref.watch(searchControllerProvider).text;
});

final filteredHospitalsProvider =
    StateProvider.autoDispose<List<HospitalModel>>((ref) {
  final bloodBanks = ref.watch(hospitalProvider);
  final searchText = ref.watch(searchControllerProvider).text;

  return bloodBanks.when(
    data: (data) {
      return data.where((bloodBank) {
        return bloodBank.name.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    },
    loading: () => [],
    error: (error, stackTrace) => [],
  );
});

class HospitalFinder extends ConsumerWidget {
  const HospitalFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final filteredHospitals = ref.watch(filteredHospitalsProvider);

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
              const Appbar(appbarHeading: 'Hospital Finder'),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 213, 161, 161),
              ],
            ),
          ),
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
                          ref.refresh(filteredHospitalsProvider);
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
                  itemCount: filteredHospitals.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(
                        height: 10,
                      );
                    }
                    final HospitalModel hospital = filteredHospitals[index - 1];
                    return CustomCard(
                      elevation: 0,
                      title: hospital.name,
                      height: 150,
                      description:
                          'Contact Info: ${hospital.contactNumber}\nAddress: ${hospital.address}',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
