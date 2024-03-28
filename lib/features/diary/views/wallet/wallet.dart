import 'package:daylio/common/widgets/basic_widget/toast.dart';
import 'package:daylio/features/diary/views/note/widget/firebase_storage_services.dart';
import 'package:daylio/features/diary/views/note/widget/note.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/shared_preferences/manage_data.dart';


class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});
  final Storage storage = Storage();
  final ManageData manageData = ManageData();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text
            SizedBox(height: 400),
            Center(child: Text('Wallet Screen')),
            ElevatedButton(
              onPressed: () {
                manageData.removeUID();
                FirebaseAuth.instance.signOut();
              },
              child: Text('Log out'),
            ),
            ElevatedButton(
              onPressed: () {
                 // storage.addNote(Note(text: "victor hugo page 142", emotion: 2, feeling: [2,4,5], image: ["image1","image2"], date: DateTime.now()));
                 storage.getNotes(DateTime.now()).then((value) => print(value?.first.text));
              },
              child: Text('Insert Data into Firebase'),
            ),
            ElevatedButton(
              onPressed: () async {

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

                storage.uploadFile(path, fileName).then((value) => showToast(message: "The image has been uploaded"));

              },
              child: Text("Upload file"),
            ),
            FutureBuilder(
                future: storage.downloadURL('picsou2.jpg'),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return Container(width: 300, height: 250, child: Image.network(snapshot.data!, fit: BoxFit.cover));
                  }
                  if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  return Container();
                }
            )
          ],
        ),
      ),
    );
  }

}
