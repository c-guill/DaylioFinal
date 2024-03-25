import 'package:flutter/material.dart';
import 'package:daylio/features/diary/views/note/write_note.dart'; 

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
  String formattedDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

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
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                formattedDate,
                style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.edit, color: Colors.black), // Logo crayon
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "How do you feel now", // Texte
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sentiment_very_satisfied, color: Colors.black),
                          Icon(Icons.sentiment_satisfied, color: Colors.black),
                          Icon(Icons.sentiment_neutral, color: Colors.black),
                          Icon(Icons.sentiment_dissatisfied, color: Colors.black),
                        ]
                      )
                    ),
                  ],
                ),
              ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Emotions", // Texte
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Wrap(
                        spacing: 20, // Espacement horizontal entre les enfants
                        runSpacing: 20, // Espacement vertical entre les lignes
                        children: [
                          // Vos 12 enfants ici
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                          Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 60),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Write a Quick note", // Texte
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WriteNoteScreen()), // Rediriger vers Page2
                        );
                      },
                      child: Text(
                        'Cliquez ici pour aller à la Page 2',
                        style: TextStyle(
                          color: Colors.blue, // Couleur du texte bleu pour indiquer un lien
                          decoration: TextDecoration.underline, // Soulignez le texte pour indiquer qu'il est cliquable
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }
}
