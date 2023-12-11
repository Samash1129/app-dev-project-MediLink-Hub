import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Cards.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class DoctorFinder extends StatelessWidget {
  const DoctorFinder({super.key});

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
                    child:
                        const Icon(Icons.arrow_back, color: Color(0xFFAF1212))),
              ),
              const Appbar(appbarHeading: 'Blood Bank Finder'),
            ],
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                const SizedBox(height: 80),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 56,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(17, 8, 8, 8),
                    child: TextField(
                      decoration: InputDecoration(
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
                      print('object');
                    },
                    color: Colors.redAccent[700]!.withOpacity(1.0),
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              width: MediaQuery.of(context).size.width * 0.93,
              child: const SingleChildScrollView(
                  child: Column(
                children: [
                  CustomCard(
                    elevation: 0,
                    title: "Blood Bank 1",
                    height: 150,
                    description:
                        'Contact Info: 1234567890\nAddress: 123, ABC Street, XYZ City',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: "Blood Bank 2",
                    height: 150,
                    description:
                        'Contact Info: 1234567890\nAddress: 123, ABC Street, XYZ City',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: "Blood Bank 3",
                    height: 150,
                    description:
                        'Contact Info: 1234567890\nAddress: 123, ABC Street, XYZ City',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: "Blood Bank 4",
                    height: 150,
                    description:
                        'Contact Info: 1234567890\nAddress: 123, ABC Street, XYZ City',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: "Blood Bank 5",
                    height: 150,
                    description:
                        'Contact Info: 1234567890\nAddress: 123, ABC Street, XYZ City',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: "Blood Bank 6",
                    height: 150,
                    description:
                        'Contact Info: 1234567890\nAddress: 123, ABC Street, XYZ City',
                  ),
                ],
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
