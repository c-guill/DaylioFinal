import 'package:flutter/material.dart';

class WriteNoteScreen extends StatelessWidget {
  const WriteNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String noteText = ''; 

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context, noteText); // Transmettre le texte à l'écran précédent
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
