import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Cards.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import '/functions/blood_bank_provider.dart';

final searchControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final searchTextProvider = Provider<String>((ref) {
  return ref.watch(searchControllerProvider).text;
});

final filteredBloodBanksProvider =
    StateProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  final bloodBanks = ref.watch(bloodBankProvider);
  final searchText = ref.watch(searchControllerProvider).text;

  print('bloodBanks');

  return bloodBanks.when(
    data: (data) {
      return data.where((bloodBank) {
        return bloodBank['name']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            (bloodBank['bloodTypes'] as List)
                .any((type) => type.toLowerCase() == searchText.toLowerCase());
      }).toList();
    },
    loading: () => [], // Return an empty list while loading
    error: (error, stackTrace) => [], // Return an empty list on error
  );
});

class BloodBankFinder extends ConsumerWidget {
  const BloodBankFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final filteredBloodBanks = ref.watch(filteredBloodBanksProvider);

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
              const Appbar(appbarHeading: 'Blood Bank Finder'),
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
                          ref.refresh(filteredBloodBanksProvider);
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
                itemCount: filteredBloodBanks.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox(
                      height: 10,
                    );
                  }
                  final Map<String, dynamic> bloodBank =
                      filteredBloodBanks[index - 1];
                  return CustomCard(
                    elevation: 0,
                    title: bloodBank['name'],
                    height: 150,
                    description:
                        // 'Contact Info: ${bloodBank['contactNumber']}\nAddress: ${bloodBank['address']}',
                        'Contact Info: ${bloodBank['contactNumber']}\nAddress: ${bloodBank['address']}\nBlood Types: ${bloodBank['bloodTypes'].join(', ')}',
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
