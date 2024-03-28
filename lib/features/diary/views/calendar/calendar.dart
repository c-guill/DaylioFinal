import 'dart:ffi';

import 'package:d_chart/bar_custom/view.dart';
import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/common/widgets/calendar/calendar_dropdown.dart';
import 'package:daylio/features/diary/controllers/calendar/calendar_controller.dart';
import 'package:daylio/features/diary/views/calendar/widgets/calendar_appbar.dart';
import 'package:daylio/features/diary/views/calendar/widgets/mood_calendar.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:daylio/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final CalendarController controller = Get.put(CalendarController());
    double chartValue = .0;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TCalendarAppBar(darkMode: darkMode),

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
                        // Call the method from the controller to update the date
                        controller.updateSelectedMonthPage(newDate);
                      },
                      mode: false,
                    ),
                  ),

                  // Mood calendar
                  TMoodCalendar(darkMode: darkMode, controller: controller),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Mood count
                  TMoodChartCount(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
