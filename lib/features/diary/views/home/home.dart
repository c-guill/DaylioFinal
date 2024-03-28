import 'package:flutter/material.dart';
import 'package:daylio/features/diary/views/note/add_note_page.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            SizedBox(height: 400),
            Center(child: Text('Home Screen')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNoteScreen()), // Rediriger vers la Page2
                );
              },
              child: Icon(Icons.add), // Utiliser l'icône d'ajout
            ),
          ],
        ),
      ),
    );
  }
}
