import 'dart:math';

import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/common/widgets/calendar/calendar_dropdown.dart';
import 'package:daylio/features/diary/controllers/home/home_controller.dart';
import 'package:daylio/features/diary/views/home/widgets/home_appbar.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = Get.put(HomeController());
    List<Note> notesForTheDay = controller.getNotesForDay(DateTime.now());
    controller.updateSelectedMonthPage(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            THomeAppBar(darkMode: darkMode),

            // body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Dropdown calendar
                  Obx(
                    () => TCalendarDropDown(
                      darkMode: darkMode,
                      selectedDate: controller.selectedDate.value,
                      onDateSelected: (newDate) {
                        controller.updateSelectedMonthPage(newDate);
                      },
                      mode: false,
                    ),
                  ),

                  Obx(() => Column(
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
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      children: notesForTheDay.map((note) {
                                        return Stack(
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
                                                          style:
                                                              const TextStyle(color: TColors.grey, fontSize: TSizes.fontSizeMd),
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
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )),
                  // // Mood calendar
                  // TMoodCalendar(darkMode: darkMode, controller: controller),
                  // const SizedBox(height: TSizes.spaceBtwSections),
                  //
                  // // Mood count
                  // TMoodChartCount(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int getDaysInMonth(DateTime date) {
    DateTime firstOfNextMonth = (date.month < 12) ? DateTime(date.year, date.month + 1, 1) : DateTime(date.year + 1, 1, 1);
    DateTime lastOfThisMonth = firstOfNextMonth.subtract(Duration(days: 1));
    return lastOfThisMonth.day;
  }

  List<DateTime> getDaysListForMonth(DateTime date) {
    List<DateTime> days = [];
    int daysInMonth = getDaysInMonth(date);

    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(date.year, date.month, i));
    }

    return days;
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
        future: Get.put(HomeController()).storage.downloadURL(image),
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
