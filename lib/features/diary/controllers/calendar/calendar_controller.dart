import 'dart:collection';

import 'package:daylio/features/diary/views/calendar/notes_page.dart';
import 'package:daylio/features/diary/views/note/widget/firebase_storage_services.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}


class CalendarController extends GetxController {
  var selectedDate = DateTime.now().obs; // GetX observable
  var mood = 'happy'.obs; // GetX observable
  // var storage = Get.put(Storage()); // GetX builder
  final Storage storage = Storage();
  final Rx<LinkedHashMap<DateTime, List<Note>>> kNotes = LinkedHashMap<DateTime, List<Note>>(
    equals: isSameDay,
    hashCode: getHashCode,
  ).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await updateNotes().then((value) => calculateRanking());
  }

  final RxList<dynamic> ranking = RxList([
    {'class': 'rad', 'total': 0},
    {'class': 'good', 'total': 0},
    {'class': 'meh', 'total': 0},
    {'class': 'sad', 'total': 0},
    {'class': 'awful', 'total': 0},
  ]);

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

    // allNotes = <DateTime, List<Note>>{}.addAll(storage.getNotes(selectedDate.value) as Map<DateTime, List<Note>>);
    await updateNotes();
    print(kNotes.value.length);
    calculateRanking();
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

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDate.value = day;
    Get.to(() => NotesScreen(date: day));
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

  /// Calculate emotions of a day
  String calculateMood(DateTime day) {
    var notes = getNotesForDay(day);
    var sumMood = 0;
    for (var note in notes) {
      sumMood += note.emotion;
    }
    var avgMood = sumMood / notes.length;
    switch (avgMood.round()) {
      case 5:
        return 'awful';
      case 4:
        return 'sad';
      case 3:
        return 'meh';
      case 2:
        return 'good';
      case 1:
        return 'rad';
      default:
        return 'meh';
    }
  }

  /// Calculate number of each emotion for a month
  void calculateRanking() {
    // Update the total count of each emotion to 0
    for (var element in ranking) {
      element['total'] = 0;
    }
    // Iterate through all notes in the month to calculate the total count of each emotion
    kNotes.value.forEach((key, value) {
      var mood = calculateMood(key);
      var index = ranking.indexWhere((element) => element['class'] == mood);
      ranking[index] = {
        ...ranking[index],
        'total': ranking[index]['total'] + 1,
      };
    });
  }

  // Get image byte name
  Future<String> getNoteImages(String name) {
    return storage.downloadURL(name);
  }
}
