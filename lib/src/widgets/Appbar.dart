import 'package:flutter/material.dart';
import 'package:app_dev_project_medilink_app/functions/authentication.dart'; // Import your authentication service

class Appbar extends StatelessWidget {
  final String appbarHeading;

  const Appbar({Key? key, required this.appbarHeading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: Color(0xFFAF1212),
                  size: 35,
                ),
                onPressed: () {
                  showProfileMenu(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showProfileMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          overlay.localToGlobal(overlay.size.topRight(Offset.zero)),
          overlay.localToGlobal(overlay.size.topRight(Offset.zero)),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'my_profile',
          child: Text('My Profile'),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Logout'),
        ),
      ],
    ).then((String? value) {
      if (value == 'my_profile') {
        // Handle "My Profile" action
        // You can navigate to the profile screen or perform any other action.
        print('Navigate to My Profile');
      } else if (value == 'logout') {
        // Handle "Logout" action
        // Call your logout function from the AuthService
        AuthService().logout();
        // Navigate to the login or home page
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }
}
