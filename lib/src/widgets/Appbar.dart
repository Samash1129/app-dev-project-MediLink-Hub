import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  final String appbarHeading;

  const Appbar({super.key, required this.appbarHeading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                appbarHeading,
                style: const TextStyle(
                    color: Color(0xFFAF1212),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.account_circle,
                  color: Color(0xFFAF1212),
                  size: 35,
                ),
              ),
            ),
          ],
        ));
  }
}
