import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FirstAidScreen extends StatelessWidget {
  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=gDwt7dD3awc',
    'https://www.youtube.com/watch?v=BQNNOh8c8ks',
    'https://www.youtube.com/watch?v=NxO5LvgqZe0',
    'https://www.youtube.com/watch?v=PhH9a0kIwmk',
  ];

  final List<String> videoDescriptions = [
    'Heart Attack Symptoms and First Aid',
    'CPR on an Adult: Step-by-Step Guide',
    'How to Stop Severe Bleeding',
    'Recognizing and Responding to a Stroke',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //     icon: const Icon(Icons.menu, color: Color(0xFFAF1212)),
        //     onPressed: () {
        //       // Add your menu icon functionality here
        //     },
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: const Icon(Icons.account_circle, color: Color(0xFFAF1212)),
        //       onPressed: () {
        //         // Add your profile icon functionality here
        //       },
        //     ),
        //   ],
        //   title: const Text(
        //     'First Aid Videos',
        //     style: TextStyle(color: Color(0xFFAF1212)),
        //   ),
        // ),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Appbar(appbarHeading: 'Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Box for Random Health Tip (Keep this part as it is)
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFAF1212),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Random Health Tip',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Here goes your random health tip. You can add more text here.',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality for Read More button and pop-up here
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFFAF1212),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text('Read More'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                // Labeled First Aid Videos with YouTube players and Descriptions
                for (int i = 0; i < videoUrls.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoDescriptions[i],
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFAF1212),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId:
                              YoutubePlayer.convertUrlToId(videoUrls[i]) ?? '',
                          flags: const YoutubePlayerFlags(autoPlay: false),
                        ),
                        showVideoProgressIndicator: true,
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
