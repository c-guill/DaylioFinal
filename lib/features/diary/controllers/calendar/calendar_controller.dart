import 'dart:collection';

import 'package:daylio/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final kFirstDay = DateTime.now();

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    DateTime.now(): [
      const Event('Today\'s Event 1'),
      const Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class CalendarController extends GetxController {
  var selectedDate = DateTime.now().obs; // GetX observable
  var mood = 'happy'.obs; // GetX observable


  final RxList<dynamic> ranking = RxList([
    {'class': 'rad', 'total': 23},
    {'class': 'good', 'total': 14},
    {'class': 'meh', 'total': 8},
    {'class': 'sad', 'total': 7},
    {'class': 'awful', 'total': 21},
  ]);

  final List chartBarColor = [
    TColors.chartRad,
    TColors.chartGood,
    TColors.chartMeh,
    TColors.chartBad,
    TColors.chartAwful,
  ];

  void updateSelectedMonthPage(DateTime newDate) {
    selectedDate.value = newDate;
    ranking[0] = {
      ...ranking[0],
      'total': ranking[0]['total'] + 1,
    };
    ranking.refresh(); // Now this should work as expected
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDate.value = day;
    Get.to(() => Container(color: Colors.white));
  }

  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }
}
