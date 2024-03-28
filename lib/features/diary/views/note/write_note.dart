import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:flutter/material.dart';

class WriteNoteScreen extends StatelessWidget {
  final Note myData;

  WriteNoteScreen({required this.myData});
  

  @override
  Widget build(BuildContext context) {
    String noteText = myData.text; 

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context, noteText ?? ""); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: TextEditingController(text: myData.text),
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Write your note here...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  noteText = value; // Mettre à jour le texte lorsque l'utilisateur saisit
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
