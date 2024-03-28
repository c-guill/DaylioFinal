import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/controllers/calendar/calendar_controller.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class TMoodCalendar extends StatelessWidget {
  const TMoodCalendar({
    super.key,
    required this.darkMode,
    required this.controller,
  });

  final bool darkMode;
  final CalendarController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ContainerCustom(
        height: TSizes.moodCalendarHeight,
        child: TableCalendar<Event>(
          locale: 'en_US',
          rowHeight: 36,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: Theme.of(context).textTheme.titleMedium!,
            leftChevronIcon: Icon(Icons.chevron_left, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight),
            rightChevronIcon: Icon(Icons.chevron_right, color: darkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight),
          ),
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            weekendTextStyle: Theme.of(context).textTheme.bodyMedium!,
            selectedTextStyle: Theme.of(context).textTheme.bodyMedium!,
            selectedDecoration: BoxDecoration(
              color: TColors.primary.withOpacity(0.5),
              shape: BoxShape.circle,
              border: Border.all(color: TColors.primary.withOpacity(0.5), width: 2),
              boxShadow: [
                BoxShadow(color: TColors.primary.withOpacity(0.5), blurRadius: 4, spreadRadius: darkMode ? 4 : 2),
              ],
            ),
            todayTextStyle: Theme.of(context).textTheme.bodyMedium!,
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: TColors.primary, width: 2),
            ),
            markersMaxCount: 0,
          ),
          calendarBuilders: CalendarBuilders(markerBuilder: (context, date, events) {
            final event = controller.getEventsForDay(date);
            if (event.isNotEmpty && !isSameDay(date, DateTime.now())) {
              return Transform.translate(
                offset: const Offset(0, -6),
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/icons/emotions/rad.png'),
                    ),
                  ),
                ),
              );
            }
          }),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, controller.selectedDate.value),
          focusedDay: controller.selectedDate.value,
          onDaySelected: controller.onDaySelected,
          onPageChanged: controller.updateSelectedMonthPage,
          eventLoader: controller.getEventsForDay,
          firstDay: DateTime.utc(2000, 01, 01),
          lastDay: DateTime.utc(2100, 12, 31),
        ),
      ),
    );
  }
}
