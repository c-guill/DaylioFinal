import 'dart:core';
import 'dart:io';

import 'package:daylio/common/widgets/basic_widget/toast.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/shared_preferences/manage_data.dart';
import 'note.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final ManageData manageData = ManageData();


  Future<void> uploadFile (
    String filePath,
    String fileName,
      ) async {
      String UID = await manageData.getUID();
      File file = File(filePath);
      String date = DateFormat('ddMMyyyy').format(DateTime.now());


      try {
        await storage.ref('$UID/$date/$fileName').putFile(file);
      } on firebase_core.FirebaseException catch(e){
        showToast(message: "A problem occured, please try again");
      }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('test').listAll();
    return results;
  }

  Future<String> downloadURL(String imageName, DateTime dateTime) async {
    String UID = await manageData.getUID();
    String date = DateFormat('ddMMyyyy').format(dateTime);
    print(imageName +" - "+date);
    String downloadURL = await storage.ref('$UID/$date/$imageName').getDownloadURL();
    return downloadURL;
  }

  Future<void> insertData() async {
    String UID = await manageData.getUID();
      CollectionReference collRef = FirebaseFirestore.instance.collection('users/$UID');
      collRef.add({
        'name': 'test',
      });
  }

  Future<void> addNote(Note note)async {
    try {
      Future<String> UID = manageData.getUID();
      String date = DateFormat('MMyyyy').format(note.date);
      UID.then((value) => {
      FirebaseFirestore.instance.collection(
      'users/$value/$date').add({
          'text': note.text,
          'emotion': note.emotion,
          'feeling': note.feeling,
          'image': note.image,
          'date': note.date.millisecondsSinceEpoch,
          }).then((value) => {note.id = value as String})
      });

      print("The note has been added");
    }catch (e){
      print("An error occured, please try again $e");
    }
  }

  Future<void> deleteNote(Note note) async {
    try {
      Future<String> UID = manageData.getUID();
      String date = DateFormat('MMyyyy').format(note.date);
      UID.then((value) => {
        FirebaseFirestore.instance
            .collection('users/$value/$date')
            .doc(note.id)
            .delete()
            .then((value) {
          print("Note deleted successfully");
        }).catchError((error) {
          print("Failed to delete note: $error");
        })
      });
    }catch (e){
      print("An error occured, please try again $e");
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      Future<String> UID = manageData.getUID();
      String date = DateFormat('MMyyyy').format(note.date);
      UID.then((value) {
        FirebaseFirestore.instance
            .collection('users/$value/$date')
            .doc(note.id)
            .update({
          'text': note.text,
          'emotion': note.emotion,
          'feeling': note.feeling,
          'image': note.image,
          'date': note.date.millisecondsSinceEpoch,
        })
            .then((value) {
          print("Note updated successfully");
        })
            .catchError((error) {
          print("Failed to update note: $error");
        });
      });
    } catch (e) {
      print("An error occurred, please try again $e");
    }
  }


  Future<List<Note>?> getNotes(DateTime dateTime) async {
    try {
      List<Note> notes = [];
      String UID = await manageData.getUID();
      String date = DateFormat('MMyyyy').format(dateTime);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users/$UID/$date').get();
      for (var doc in querySnapshot.docs) {
       notes.add(Note(
          text: doc["text"],
          image: doc["image"],
          date: DateTime.fromMillisecondsSinceEpoch(doc["date"]),
          emotion: doc["emotion"],
          feeling: doc["feeling"],
          id: doc.id
        ));
      }
      return notes;

    }catch (e){
      print("An error occured, please try again $e");
    }
    return null;
  }
}