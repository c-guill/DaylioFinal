import 'dart:math';

import 'package:daylio/common/widgets/appbar/appbar.dart';
import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/controllers/calendar/calendar_controller.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    // Assume this method returns the list of notes for the given date
    final controller = Get.put(CalendarController());
    List<Note> notesForTheDay = controller.getNotesForDay(date);

    if (notesForTheDay.isEmpty) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              const TAppBar(showBackArrow: true),

              Text(THelperFunctions.getFormattedDate(date), style: Theme.of(context).textTheme.headlineMedium),

              // Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    ContainerCustom(
                      child: Text('No notes for this day...', style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Action for creating a new note
                        },
                        child: const Text('Create a new note!'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TAppBar(showBackArrow: true),

            Text(THelperFunctions.getFormattedDate(date), style: Theme.of(context).textTheme.headlineMedium),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ContainerCustom(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: notesForTheDay.map((note) {
                          return Container(
                            child: Stack(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: TSizes.xs),
                                    Column(
                                      children: [
                                        // CircleAvatar(
                                        //   backgroundImage: AssetImage(controller.emotionsImagePaths[note.emotion-1]), // Replace with your emoji asset
                                        // ),
                                        circleEmotion(
                                            'assets/icons/emotions/${controller.emotionsImagePaths[note.emotion - 1]}.png'),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.emotionsImagePaths[note.emotion - 1],
                                              style: TextStyle(
                                                color: controller.chartBarColor[note.emotion - 1],
                                                fontWeight: FontWeight.bold,
                                                fontSize: TSizes.fontSizeLg,
                                              ),
                                            ),
                                            Text(
                                              getRandomTime(), // Assuming this is the time
                                              style: const TextStyle(color: TColors.grey, fontSize: TSizes.fontSizeMd),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 27),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.cloud, color: Colors.blue),
                                            SizedBox(width: 8),
                                            Icon(Icons.star, color: Colors.yellow),
                                            SizedBox(width: 8),
                                            Icon(Icons.run_circle, color: Colors.red),
                                            SizedBox(width: 8),
                                            Icon(Icons.directions_walk, color: Colors.green),
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                        SizedBox(
                                          width: THelperFunctions.screenWidth() - 2 * TSizes.defaultSpace - 120,
                                          child: Text(
                                            note.text,
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: note.image.map((image) {
                                            return imageOfNotes(image);
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: -10,
                                  top: -10,
                                  child: buildPopupMenuButton(context),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for creating a new note
                      },
                      child: const Text('Create a new note!'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton(context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // Handle the action based on the selected value
        print('Selected: $value');
        switch (value) {
          case 'Edit':
            // Handle edit action
            // Get.to(() => EditNoteScreen());
            break;
          case 'Share':
            // Handle share action
            break;
          case 'Delete':
            // Handle delete action
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem<String>(
          value: 'Share',
          child: Text('Share'),
        ),
        const PopupMenuItem<String>(
          value: 'Delete',
          child: Text('Delete'),
        ),
      ],
      icon: const Icon(Icons.more_vert),
      color: THelperFunctions.isDarkMode(context) ? TColors.black : Colors.white,
    );
  }

  Widget imageOfNotes(String image) {
    return FutureBuilder(
        future: Get.put(CalendarController()).storage.downloadURL(image),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(snapshot.data!), fit: BoxFit.cover)),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Container();
        });
  }

  Container circleEmotion(String image) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
    );
  }

  String getRandomTime() {
    var random = Random();

    int hour = random.nextInt(24);
    int minute = random.nextInt(60);

    DateTime now = DateTime.now();
    DateTime randomTime = DateTime(now.year, now.month, now.day, hour, minute);

    String formattedTime = DateFormat('HH:mm').format(randomTime);

    return formattedTime;
  }
}
