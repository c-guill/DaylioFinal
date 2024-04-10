import 'dart:math';

import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/common/widgets/calendar/calendar_dropdown.dart';
import 'package:daylio/features/diary/controllers/home/home_controller.dart';
import 'package:daylio/features/diary/views/home/widgets/home_appbar.dart';
import 'package:daylio/features/diary/views/home/widgets/home_timeline.dart';
import 'package:daylio/features/diary/views/note/add_note_page.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../note/widget/firebase_storage_services.dart';

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

                  // Timeline of notes
                  THomeTimeline(darkMode: darkMode, controller: controller, notesForTheDay: notesForTheDay,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


