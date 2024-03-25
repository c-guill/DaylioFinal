import 'package:flutter/material.dart';

class WriteNoteScreen extends StatelessWidget {
  const WriteNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close), // Utiliser l'icône de fermeture
            onPressed: () {
              Navigator.pop(context); // Fermer l'écran actuel
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
