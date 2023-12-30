import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HealthTipWidget extends StatelessWidget {
  const HealthTipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomTip = FirebaseFirestore.instance
        .collection('tips')
        .limit(1)
        .get()
        .then((snapshot) => snapshot.docs.first.data());

    return FutureBuilder<Map<String, dynamic>>(
      future: randomTip,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.hasData) {
          final data = snapshot.data!;
          final heading = data['heading'] ?? 'Random Health Tip';
          final body = data['body'] ?? 'No health tip available';

          return Container(
            width: MediaQuery.of(context).size.width * 0.89,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFAF1212),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Container(
                        width: MediaQuery.of(context).size.width * 0.89,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: AlertDialog(
                          title: Text(heading,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          content: Text(
                              body, // Display full body text in alert dialog
                              style: const TextStyle(color: Colors.white)),
                          backgroundColor: const Color(0xFFAF1212),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFAF1212),
                                backgroundColor: Colors.white,
                              ),
                              child: const Text('Close',
                                  style: TextStyle(color: Color(0xFFAF1212))),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFAF1212),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Read More'),
                ),
              ],
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
