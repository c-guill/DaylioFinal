import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/features/diary/controllers/calendar/calendar_controller.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
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
    return ContainerCustom(
      height: TSizes.moodCalendarHeight,
      child: Obx(
        () => TableCalendar<Note>(
          key: ValueKey(controller.kNotes.value.length),
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
            todayTextStyle: Theme.of(context).textTheme.bodyMedium!,
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: TColors.primary, width: 4),
              boxShadow: [
                BoxShadow(color: TColors.primary.withOpacity(0.5), blurRadius: 4, spreadRadius: 4),
              ],
            ),
            selectedDecoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            markersMaxCount: 0,
          ),
          calendarBuilders: CalendarBuilders(markerBuilder: (context, date, events) {
            final notes = controller.getNotesForDay(date);
            if (notes.isNotEmpty) {
              return emotionIconsBuild(controller.calculateMood(date));
            }
            return null;
          }),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, controller.selectedDate.value),
          focusedDay: controller.selectedDate.value,
          onDaySelected: controller.onDaySelected,
          onPageChanged: (date) async {
            await controller.updateSelectedMonthPage(date);
          },
          eventLoader: (date) {
            return controller.getNotesForDay(date);
          },
          firstDay: DateTime.utc(2000, 01, 01),
          lastDay: DateTime.utc(2100, 12, 31),
        ),
      ),
    );
  }

  Transform emotionIconsBuild(String mood) {
    return Transform.translate(
      offset: const Offset(0, -6),
      child: Container(
        width: TSizes.iconMd,
        height: TSizes.iconMd,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/icons/emotions/$mood.png'),
          ),
        ),
      ),
    );
  }
}
