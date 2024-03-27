import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:daylio/features/diary/views/note/write_note.dart'; 
import 'package:daylio/utils/constants/text_strings.dart';


class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreen createState() => _AddNoteScreen();
}

class _AddNoteScreen extends State<AddNoteScreen>{
  String texte = "";
  bool tap = false;
  Map<String, bool> tapStates = {
    'very_sad_b.png': false,
    'sad_b.png': false,
    'meh_b.png': false,
    'happy_b.png': false,
    'very_happy_b.png': false,
  };
  Map<String, bool> tapStates2 = {
    'excited_b.png': false,
    'relaxed_b.png': false,
    'proud_b.png': false,
    'hopeful_b.png': false,
    'happy2_b.png': false,
    'tired_b.png': false,
    'lonely_b.png': false,
    'angry_b.png': false,
    'annoyed_b.png': false,
    'lucky_b.png': false,
    'sad2_b.png': false,
    'anxious_b.png': false,
  };

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
                style: TextStyle(color: TColors.iconPrimaryLight ),
            ),
            Icon(Icons.edit, color: TColors.iconPrimaryLight ), // Logo crayon
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ContainerCustom(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.feeling, // Texte
                      style: TextStyle(color: TColors.iconPrimaryLight , fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          buildEmojiImage('very_sad_b.png',context),
                          buildEmojiImage('sad_b.png',context),
                          buildEmojiImage('meh_b.png',context),
                          buildEmojiImage('happy_b.png',context),
                          buildEmojiImage('very_happy_b.png',context),
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
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child:ContainerCustom(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.emotions, // Texte
                      style: TextStyle(color: TColors.iconPrimaryLight , fontSize: 16),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: Wrap(
                        spacing: 20, // Espacement horizontal entre les enfants
                        runSpacing: 20, // Espacement vertical entre les lignes
                        children: [
                          // Vos 12 enfants ici
                          buildEmojiImage2('excited_b.png',context),
                          buildEmojiImage2('relaxed_b.png',context),
                          buildEmojiImage2('proud_b.png',context),
                          buildEmojiImage2('hopeful_b.png',context),
                          buildEmojiImage2('happy2_b.png',context),
                          buildEmojiImage2('tired_b.png',context),
                          buildEmojiImage2('lonely_b.png',context),
                          buildEmojiImage2('angry_b.png',context),
                          buildEmojiImage2('annoyed_b.png',context),
                          buildEmojiImage2('lucky_b.png',context),
                          buildEmojiImage2('sad2_b.png',context),
                          buildEmojiImage2('anxious_b.png',context),
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
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ContainerCustom(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.note, // Texte
                      style: TextStyle(color: TColors.iconPrimaryLight , fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () async {
                        texte = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WriteNoteScreen()), // Rediriger vers Page2
                        );
                      },
                      child: Text(
                        TTexts.openNote,
                        style: TextStyle(
                          color: Colors.blue, // Couleur du texte bleu pour indiquer un lien
                          decoration: TextDecoration.underline, // Soulignez le texte pour indiquer qu'il est cliquable
                        ),
                      ),
                    ),
                    TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: TTexts.openNote,
                        ),
                      ),
                  ],
                ),
              ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ContainerCustom(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.photos, // Texte
                      style: TextStyle(color: TColors.iconPrimaryLight, fontSize: 16),
                    ),
                    Expanded(  
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Action lorsque le premier widget est tapé
                            },
                            child: Container(
                              
                              height: 45,
                              width: 141,
                              decoration: BoxDecoration(
                                color: TColors.softGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt, color: TColors.primary),
                                  SizedBox(width: 5),
                                  Text(
                                    TTexts.photo,
                                    style: TextStyle(
                                      color: TColors.primary,
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 12, 
                                    ),
                                  ),
                                ],
                              ),
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                            onTap: () {
                              // Action lorsque le premier widget est tapé
                            },
                            child: Container(
                              height: 45,
                              width: 141,
                              decoration: BoxDecoration(
                                color: TColors.softGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt, color: TColors.primary),
                                  SizedBox(width: 5),
                                  Text(
                                    TTexts.gallery,
                                    style: TextStyle(
                                      color: TColors.primary,
                                      fontWeight: FontWeight.bold, // Texte en gras
                                      fontSize: 12, // Taille de police de 12
                                    ),
                                  ),
                                ],
                              ),
                              ),
                            ),
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
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ContainerCustom(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.voice, 
                      style: TextStyle(color: TColors.iconPrimaryLight, fontSize: 16),
                    ),
                    Expanded(  
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ 
                        GestureDetector(
                              onTap: () {
                                // Action lorsque le premier widget est tapé
                                print(texte);
                              },
                              child: Container(
                                height: 50,
                                width: 303,
                                decoration: BoxDecoration(
                                  color: TColors.softGrey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.keyboard_voice_rounded, color: TColors.primary),
                                    SizedBox(width: 5),
                                    Text(
                                      TTexts.record,
                                      style: TextStyle(
                                        color: TColors.primary,
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 12, 
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              ),
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
      ],
    ),
  );
  }

  Widget buildEmojiImage(String imageName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var key in tapStates.keys) {
            tapStates[key] = false;
          }
          tapStates[imageName] = !tapStates[imageName]!;
        });
      },
      child: tapStates[imageName] == true ? 
          Image.asset(
            'assets/images/emoji/${imageName.replaceAll("_b", "")}', 
            height: 60,
            width: 60,
          ) 
          : 
          Image.asset(
            'assets/images/emoji/$imageName', 
            height: 60,
            width: 60,
          ),
    );
  }

  Widget buildEmojiImage2(String imageName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapStates2[imageName] = !tapStates2[imageName]!;
        });
      },
      child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: tapStates2[imageName] == true ?  TColors.emojiContainer.withOpacity(0.5) : TColors.emojiContainer.withOpacity(0.5),
          ),
        ),
        Image.asset(
          tapStates2[imageName] == true ? 
              'assets/images/emoji/${imageName.replaceAll("_b", "")}' 
              : 
              'assets/images/emoji/$imageName', 
          height: 50,
          width: 50,
        ),
      ],
    ),
    );
  }

}

