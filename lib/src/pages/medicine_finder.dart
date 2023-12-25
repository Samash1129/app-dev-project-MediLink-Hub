// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Cards.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';

class MedicineFinder extends StatefulWidget {
  const MedicineFinder({Key? key}) : super(key: key);

  @override
  _MedicineFinderState createState() => _MedicineFinderState();
}

class _MedicineFinderState extends State<MedicineFinder> {
  late TextEditingController searchController;
  late List<Map<String, dynamic>> medicines;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    medicines = [];
    fetchMedicines(); // Fetch medicines on initial load
  }

  Future<void> fetchMedicines() async {
    try {
      setState(() {
        isLoading = true;
      });

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('medicines').get();

      List<Map<String, dynamic>> medicineList = [];

      for (final QueryDocumentSnapshot<Map<String, dynamic>> document
          in snapshot.docs) {
        final Map<String, dynamic> data = document.data();

        medicineList.add({
          'name': data['name'],
          'formula': data['formula'],
        });
      }

      setState(() {
        medicines = medicineList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error, e.g., show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred while fetching data. $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> searchMedicines(String searchText) async {
    try {
      setState(() {
        isLoading = true;
      });

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('medicines').get();

      List<Map<String, dynamic>> results = [];

      for (final QueryDocumentSnapshot<Map<String, dynamic>> document
          in snapshot.docs) {
        final Map<String, dynamic> data = document.data();

        if (data['formula']
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          results.add({
            'name': data['name'],
            'formula': data['formula'],
          });
        }
      }

      setState(() {
        medicines = results;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error, e.g., show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred while fetching data. $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const Appbar(appbarHeading: 'Medicine Finder'),
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
                          searchMedicines(value);
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
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: medicines.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return const SizedBox(
                              height: 10,
                            );
                          }
                          final Map<String, dynamic> medicine =
                              medicines[index - 1];
                          return CustomCard(
                            elevation: 0,
                            title: medicine['name'],
                            height: 100,
                            description: '${medicine['formula']}',
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
