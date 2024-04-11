import 'dart:io';

import 'package:daylio/common/styles/spacing_styles.dart';
import 'package:daylio/common/widgets/basic_widget/container.dart';
import 'package:daylio/common/widgets/basic_widget/toast.dart';
import 'package:daylio/features/diary/controllers/calendar/calendar_controller.dart';
import 'package:daylio/features/diary/controllers/home/home_controller.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:daylio/features/diary/views/note/widget/firebase_storage_services.dart';
import 'package:daylio/utils/constants/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:daylio/features/diary/views/note/write_note.dart'; 
import 'package:daylio/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';



class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreen createState() => _AddNoteScreen();
}

class _AddNoteScreen extends State<AddNoteScreen>{
  double heightPhoto = 150;
  final Storage storage = Storage();
  bool tap = false;
  bool check_edit = false;
  bool check_chargement = false;
  bool check_chargement2 = false;
  bool check_chargement_text = false;
  bool check_chargement_image = false;
  List<String> imagePath = [];
  final ImagePicker _picker = ImagePicker();
  List<String> states = ['very_happy_b.png', 'happy_b.png', 'meh_b.png', 'sad_b.png', 'very_sad_b.png'];
  List<String> states2 = ['excited_b.png','relaxed_b.png','proud_b.png','hopeful_b.png','happy2_b.png','tired_b.png','lonely_b.png','angry_b.png','annoyed_b.png','lucky_b.png','sad2_b.png','anxious_b.png',];
  Map<String, bool> tapStates = {
    'very_happy_b.png': false,
    'happy_b.png': false,
    'meh_b.png': false,
    'sad_b.png': false,
    'very_sad_b.png': false,
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
  Note myData = Note(
    id: "",
    text: "",
    emotion: 0,
    feeling: [],
    image: [],
    date: DateTime.now()
  );
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Ajouter un listener au TextEditingController
    _textFieldController.addListener(_updateText);
  }

  @override
  Widget build(BuildContext context) {
    final edit = Get.arguments;
    if (edit == null || edit.toString().isEmpty) {
      check_edit = false ;
    }else{
      check_edit = true;
      if (check_chargement==false){
        tapStates[states[edit.emotion-1]] = true;
      }
      if (check_chargement2==false){
        for (var element in edit.feeling) {
          tapStates2[states2[element-1]] = true;
        }
      }
      if (check_chargement_text==false){
        myData.text = edit.text;
        _textFieldController.text = myData.text;
      }
      if (check_chargement_image==false){
        myData.image = edit.image;
        check_chargement_image = true;
      }

    }
    DateTime now = DateTime.now();
  String formattedDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

  return Scaffold(
    
    body: SingleChildScrollView(
      
      child :
      Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight, // without appBar 
          
       child :Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                formattedDate,
                style: TextStyle(color: TColors.iconPrimaryLight ,fontWeight: FontWeight.bold, fontSize: 18),
            ),
            //Icon(Icons.edit, color: TColors.iconPrimaryLight ), // Logo crayon
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FractionallySizedBox(
              widthFactor: 1,
              child: ContainerCustom(
                height: 100,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.feeling, // Texte
                      style: TextStyle(color: TColors.iconPrimaryLight , fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildEmojiImage(states[0],context),
                            buildEmojiImage(states[1],context),
                            buildEmojiImage(states[2],context),
                            buildEmojiImage(states[3],context),
                            buildEmojiImage(states[4],context),
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
              widthFactor: 1,
              child:ContainerCustom(
                height: 290,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.emotions, // Texte
                      style: TextStyle(color: TColors.iconPrimaryLight , fontSize: 16),
                    ),
                    SizedBox(height: 10),
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
              widthFactor: 1,
              child: ContainerCustom(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
            children: [
              Expanded(
                child: Text(
                  TTexts.note,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: GestureDetector(
                        onTap: () async {
                          myData.text = _textFieldController.text;
                          String? result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WriteNoteScreen(myData: myData)), 
                          );
                          if (result != null) {
                            check_chargement_text = true;
                            myData.text = result;
                            _textFieldController.text = result;
                          }
                        },
                        child: Text(
                          TTexts.openNote,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.blue, 
                            decoration: TextDecoration.underline, 
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                    TextField(
                      controller: _textFieldController,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: myData.text != "" ? "" : TTexts.write,
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
              child: ContainerCustom(
                height: heightPhoto,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.photos, // Texte
                      style: TextStyle(color: TColors.iconPrimaryLight, fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    Expanded(  
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                            final pickedFile = await _picker.pickImage(source: ImageSource.camera); // Utiliser pickImage() au lieu de getImage()
                            if(pickedFile == null){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('no file selected.')));
                                return;
                              }
                            final String path = pickedFile.path;
                            final String fileName = pickedFile.name;
                            myData.image.add(fileName);
                            setState(() {
                              imagePath.add(path);
                            });
                            heightPhoto = 250;
                            storage.uploadFile(path, fileName).then((value) => showToast(message: "The image has been uploaded"));
                          },
                            child: Expanded( 
                              child :Container(
                              height: 40,
                              width: 120,
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
                              ),),
                            ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () async {
                              final results = await FilePicker.platform.pickFiles(
                                  allowMultiple: false,
                                  type: FileType.custom,
                                  allowedExtensions: ['png','jpg','jpeg']
                              );
                              if(results == null){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('no file selected.')));
                                return;
                              }
                              final path = results.files.single.path ?? '';
                              final fileName = results.files.single.name;
                              myData.image.add(fileName);
                              setState(() {
                                imagePath.add(path);
                              });
                              heightPhoto = 250;
                              storage.uploadFile(path, fileName).then((value) => showToast(message: "The image has been uploaded"));
                          },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: TColors.softGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                      children: [
                        SizedBox(height: 50,),
                        for (var image in imagePath)
                        Image.file(
                              File(image),
                              width: 100, 
                              height: 100, 
                              fit: BoxFit.cover, 
                            ),
                        
                      ],
                    ),
                    ),
                  ],
                ),
              ),
              
            ),
            
          ],
        ),
        /*myData.image.isNotEmpty
        ? FutureBuilder(
          future: storage.downloadURL(myData.image[0]),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              return Container(width: 300, height: 250, child: Image.network(snapshot.data!, fit: BoxFit.cover));
            }
            if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
              return CircularProgressIndicator();
            }
            return Container();
          }
          ) :Container(),*/
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child:GestureDetector(
              onTap: () {
                // Action lorsque le premier widget est tapé
                if (myData.text.isEmpty){
                  myData.text = _textFieldController.text;
                }
                int i = 1;
                int j = 1;
                for (var key in tapStates.keys) {
                  if (tapStates[key] != false){
                    myData.emotion = i;
                  }
                  i+=1;
                }
                for (var key in tapStates2.keys) {
                  if (tapStates2[key] != false){
                    myData.feeling.add(j);
                  }
                  j+=1;
                }
                print(myData.image);
                if (check_edit==false){
                  storage.addNote(myData);
                }else{
                  edit.text = myData.text;
                  edit.emotion = myData.emotion;
                  edit.feeling = myData.feeling;
                  edit.image = myData.image;
                  storage.updateNote(edit);
                }
                
                final controller = Get.put(HomeController()).updateSelectedMonthPage(DateTime.now());
                Get.back();
              ; 
              },
              child: Container(
                width: 60,
                height: 60,
                child: 
                  Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 40, // Taille de l'icône
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TColors.emojiContainer.withOpacity(0.5),
                ),
              ),
              ),
            ),
          ],
        ),
      ],
    ),
    ),),
  );
  }

  Widget buildEmojiImage(String imageName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        check_chargement = true;
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
            height: 40,
            width: 40,
          ) 
          : 
          Image.asset(
            'assets/images/emoji/$imageName', 
            height: 40,
            width: 40,
          ),
    );
  }

  Widget buildEmojiImage2(String imageName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        check_chargement2=true;
        setState(() {
          tapStates2[imageName] = !tapStates2[imageName]!;
        });
        print(tapStates2);
        print(imageName);
        print(tapStates2[imageName]);
        tapStates2[imageName] == true ? 
              print('assets/images/emoji/${imageName.replaceAll("_b", "")}') 
              : 
              print('assets/images/emoji/$imageName');
      },
      child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 55,
          height: 55,
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
          height: 45,
          width: 45,
        ),
      ],
    ),
    );
  }

  void _updateText() {
    setState(() {
      check_chargement_text = true;
      myData.text = _textFieldController.text;
    });
  }

}

