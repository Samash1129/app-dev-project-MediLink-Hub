import 'package:app_dev_project_medilink_app/models/firstAid/first_aid_model.dart';
import 'package:app_dev_project_medilink_app/screens/firstAid/first_aid_notifier.dart';
import 'package:app_dev_project_medilink_app/widgets/appbar_widget.dart';
import 'package:app_dev_project_medilink_app/widgets/health_tip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final firstAidsProvider = StateProvider.autoDispose<List<FirstAidModel>>((ref) {
  final firstAids = ref.watch(firstAidProvider);

  return firstAids.when(
    data: (data) {
      return data;
    },
    loading: () => [],
    error: (error, stackTrace) => [],
  );
});

class FirstAidScreen extends ConsumerWidget {
  // final List<String> videoUrls = [
  //   'https://www.youtube.com/watch?v=gDwt7dD3awc',
  //   'https://www.youtube.com/watch?v=BQNNOh8c8ks',
  //   'https://www.youtube.com/watch?v=NxO5LvgqZe0',
  //   'https://www.youtube.com/watch?v=PhH9a0kIwmk',
  // ];

  // final List<String> videoDescriptions = [
  //   'Heart Attack Symptoms and First Aid',
  //   'CPR on an Adult: Step-by-Step Guide',
  //   'How to Stop Severe Bleeding',
  //   'Recognizing and Responding to a Stroke',
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstAids = ref.watch(firstAidsProvider);

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
              const Appbar(appbarHeading: 'First Aid'),
            ],
          ),
        ),
        body: Container(
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Box for Random Health Tip (Keep this part as it is)
                  // Container(
                  //   padding: const EdgeInsets.all(16.0),
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFAF1212),
                  //     borderRadius: BorderRadius.circular(12.0),
                  //   ),
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text(
                    //       'Random Health Tip',
                    //       style: TextStyle(
                    //         fontSize: 18.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     const SizedBox(height: 8.0),
                    //     const Text(
                    //       'Here goes your random health tip. You can add more text here.',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     const SizedBox(height: 8.0),
                    //     ElevatedButton(
                    //       onPressed: () {
                    //         // Add functionality for Read More button and pop-up here
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //         foregroundColor: const Color(0xFFAF1212),
                    //         backgroundColor: Colors.white,
                    //       ),
                    //       child: const Text('Read More'),
                    //     ),
                    //   ],
                    // ),
                  // ),
                  const HealthTipWidget(),
                  const SizedBox(height: 16.0),
                  // Labeled First Aid Videos with YouTube players and Descriptions
                  for (final firstAid in firstAids ?? [])
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstAid.name,
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
                                YoutubePlayer.convertUrlToId(firstAid.url) ??
                                    '',
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
      ),
    );
  }
}
