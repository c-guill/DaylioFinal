import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/controllers/home/home_controller.dart';
import 'package:daylio/features/diary/views/note/add_note_page.dart';
import 'package:daylio/features/diary/views/note/widget/firebase_storage_services.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THomeTimeline extends StatelessWidget {
  THomeTimeline({
    super.key,
    required this.darkMode,
    required this.controller,
    required this.notesForTheDay,
  });

  final bool darkMode;
  final HomeController controller;
  final Storage storage = Storage();
  List<Note> notesForTheDay;

  @override
  Widget build(BuildContext context) {

    return Obx(() => Column(
      children: getDaysListForMonth(controller.selectedDate.value).map((day) {
        // return Text(DateFormat('EEEE, MMMM d').format(day), style: const TextStyle(fontSize: TSizes.fontSizeMd));
        notesForTheDay = controller.getNotesForDay(day);

        if (notesForTheDay.isEmpty) {
          return const SizedBox.shrink(); // Do not show anything if there are no notes
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
          child: Column(
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/notes/Maple.png'),
                    width: TSizes.iconMd,
                    height: TSizes.iconMd,
                  ),
                  const SizedBox(width: 8),
                  Text(DateFormat('dd MMMM').format(day),
                      style: const TextStyle(fontSize: TSizes.fontSizeSm)),
                ],
              ),
              ContainerCustom(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: notesForTheDay.map((note) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: TSizes.lg),
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
                                          DateFormat('HH:mm').format(note.date), // Assuming this is the time
                                          style:
                                          TextStyle(color: darkMode ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5), fontSize: TSizes.fontSizeMd),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: TSizes.xl),
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
                                    const SizedBox(height: TSizes.md),
                                    SizedBox(
                                      width: THelperFunctions.screenWidth() - 2 * TSizes.defaultSpace - 130,
                                      child: Text(
                                        note.text,
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: darkMode ? TColors.white.withOpacity(0.5) : TColors.black.withOpacity(0.6)),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: note.image.map((image) {
                                        return imageOfNotes(image, note.date);
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Positioned(
                              top: 0, // Top position
                              bottom: 0, // Bottom position to stretch the line vertically
                              left: 70,
                              child: Container(
                                width: 1.0, // Line thickness
                                color: darkMode ? TColors.white.withOpacity(0.5) : TColors.black.withOpacity(0.2),
                              ),
                            ),

                            Positioned(
                              right: -10,
                              top: -10,
                              child: buildPopupMenuButton(context, note),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ));
  }

  int getDaysInMonth(DateTime date) {
    DateTime firstOfNextMonth = (date.month < 12) ? DateTime(date.year, date.month + 1, 1) : DateTime(date.year + 1, 1, 1);
    DateTime lastOfThisMonth = firstOfNextMonth.subtract(Duration(days: 1));
    return lastOfThisMonth.day;
  }

  List<DateTime> getDaysListForMonth(DateTime date) {
    List<DateTime> days = [];
    int daysInMonth = getDaysInMonth(date);

    for (int i = daysInMonth; i > 1; i--) {
      days.add(DateTime(date.year, date.month, i));
    }

    return days;
  }

  PopupMenuButton<String> buildPopupMenuButton(context, Note note) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // Handle the action based on the selected value
        print('Selected: $value ${note.id}');
        switch (value) {
          case 'Edit':
            Get.to(const AddNoteScreen(), arguments: note);
            //note.text = "hiha";
            //storage.updateNote(note);
            //Get.put(HomeController()).updateSelectedMonthPage(note.date);
            break;
          case 'Share':
          // Handle share action
            break;
          case 'Delete':
            storage.deleteNote(note);
            Get.put(HomeController()).updateSelectedMonthPage(note.date);
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

  Widget imageOfNotes(String image, DateTime dateTime) {
    return FutureBuilder(
        future: Get.put(HomeController()).storage.downloadURL(image, dateTime),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(snapshot.data!), fit: BoxFit.cover),
                  ),
                ),
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

}