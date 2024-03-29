import 'dart:collection';

import 'package:daylio/features/diary/views/home/utils.dart';
import 'package:daylio/features/diary/views/note/widget/firebase_storage_services.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeController extends GetxController {
  var selectedDate = DateTime.now().obs; // GetX observable
  final Storage storage = Storage();
  final Rx<LinkedHashMap<DateTime, List<Note>>> kNotes = LinkedHashMap<DateTime, List<Note>>(
    equals: isSameDay,
    hashCode: getHashCode,
  ).obs;

  final List chartBarColor = [
    TColors.chartRad,
    TColors.chartGood,
    TColors.chartMeh,
    TColors.chartBad,
    TColors.chartAwful,
  ];

  List<String> emotionsImagePaths = [
    'rad',
    'good',
    'meh',
    'sad',
    'awful',
  ];

  Future<void> updateSelectedMonthPage(DateTime newDate) async {
    selectedDate.value = newDate;

    await updateNotes();
  }

  Future<void> updateNotes() async {
    List<Note>? monthNotes = await storage.getNotes(selectedDate.value);

    if (monthNotes != null) {
      final Map<DateTime, List<Note>> newEventSource = {};

      for (var note in monthNotes) {
        // Use the date as the key to group notes by date
        final noteDate = DateTime(note.date.year, note.date.month, note.date.day, note.date.hour, note.date.minute);

        // If the key doesn't exist, create a new list, otherwise add to the existing list
        if (newEventSource[noteDate] == null) {
          newEventSource[noteDate] = [note];
        } else {
          newEventSource[noteDate]?.add(note);
        }
      }

      kNotes.value = LinkedHashMap<DateTime, List<Note>>(
        equals: isSameDay,
        hashCode: getHashCode,
      )..addAll(newEventSource);
      update();
    }
  }

  List<Note> getNotesForDay(DateTime day) {
    // Access the LinkedHashMap using .value on the observable
    var eventsMap = kNotes.value;

    // Iterate through the map to find the list of events for the specified day
    for (var entry in eventsMap.entries) {
      if (isSameDay(entry.key, day)) {
        return entry.value;
      }
    }

    // If no events found for the day, return an empty list
    return [];
  }
}
