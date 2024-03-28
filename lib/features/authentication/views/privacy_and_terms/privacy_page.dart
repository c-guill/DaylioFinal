import 'package:flutter/material.dart';


class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: const SingleChildScrollView(
          child: Padding(

            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daylio App Privacy Policy',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Data Collection',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'We collect certain information when you use our Daylio app. This information may include:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '- Personal identification information you provide, such as your name, email address, and other information you choose to share.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '- Log data that may include information such as your IP address, browser type, operating system, app activity, and other diagnostic data.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Use of Data',
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '- We use the collected information for various purposes, including:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),Text(
                  '- Providing and maintaining our Daylio app.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 10,
                ),Text(
                  '- Improving, customizing, and developing our app.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 10,
                ),Text(
                  '- Contacting you with information, updates, and offers about our app.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 10,
                ),Text(
                  '- Detecting, preventing, and addressing technical issues.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 20,
                ),Text(
                  'Data Sharing',
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'We may share your personal information in the following situations:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),Text(
                  '- With your consent.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 10,
                ),Text(
                  '- With third-party service providers who provide services on our behalf.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 10,
                ),SizedBox(
                  height: 20,
                ), Text(
                  'Data Security',
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),
                ),Text(
                  'The security of your data is important to us, but remember that no method of transmission over the internet or electronic storage is 100% secure. We strive to use commercially acceptable means to protect your personal data.',
                  style: TextStyle(fontSize: 16.0,),
                ), Text(
                  'Changes to the Privacy Policy',
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),
                ),Text(
                  'We reserve the right to update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
                  style: TextStyle(fontSize: 16.0,),
                ),
                SizedBox(
                  height: 50,
                ),Text(
                  'Contact',
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),
                ),SizedBox(
                  height: 10,
                ),Text(
                  'If you have any questions or concerns about our Privacy Policy, please contact us at contact@daylio.com.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 20,
                ),Text(
                  'Effective Date',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),
                ),SizedBox(
                  height: 10,
                ),Text(
                  'These Terms of Service were effective as of January 1, 2024.',
                  style: TextStyle(fontSize: 16.0),
                ),SizedBox(
                  height: 50,
                ),
                // Ajoutez ici le reste du contenu des conditions d'utilisation...
              ],
            ),
          ),
        )
    );
  }
}
