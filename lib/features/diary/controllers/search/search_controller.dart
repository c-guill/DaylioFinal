import 'package:daylio/features/diary/views/note/widget/firebase_storage_services.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class SearchPageController extends GetxController {
  var selectedDate = DateTime.now().obs; // GetX observable
  final Storage storage = Storage();

  final List<String> emotionsImagePaths = [
    'rad',
    'good',
    'meh',
    'sad',
    'awful',
  ];

  final List chartBarColor = [
    TColors.chartRad,
    TColors.chartGood,
    TColors.chartMeh,
    TColors.chartBad,
    TColors.chartAwful,
  ];

  Future<List<Note>> resultsNotes(String data) async {
    // Fetch all notes and provide an empty list as a fallback if null
    List<Note>? allNotes = await storage.getAllNotesForUser();

    // Prepare the date formatter
    DateFormat format = DateFormat('dd MMMM yyyy HH mm');

    // Filter notes based on the query
    List<Note> filteredNotes = allNotes!.where((note) {
      // Check if the text contains the query
      bool textMatches = note.text.toLowerCase().contains(data.toLowerCase());

      // Format the date and check if it matches the query
      String formattedDate = format.format(note.date);
      bool dateMatches = formattedDate.toLowerCase().contains(data.toLowerCase());

      // Check if the emotion text contains the query
      bool emotionMatches = emotionsImagePaths[note.emotion - 1].toLowerCase().contains(data.toLowerCase());

      return textMatches || dateMatches || emotionMatches;
    }).toList();

    // Deduplicate notes by note.id
    Map<String, Note> uniqueNotesMap = {};
    for (Note note in filteredNotes) {
      if (!uniqueNotesMap.containsKey(note.id)) {
        uniqueNotesMap[note.id] = note;  // Add the note to the map if not already added
      }
    }

    // Extract the deduplicated notes from the map
    List<Note> deduplicatedNotes = uniqueNotesMap.values.toList();

    return deduplicatedNotes;
  }
}
