import 'package:flutter/material.dart';


class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
            'TERMS OF SERVICE FOR THE DAYLIO APP',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Introduction',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Welcome to Daylio, a personal journaling app. By using the Daylio app, you agree to these Terms of Service. Please read them carefully before using the app.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Acceptance of Terms',
            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'By using the Daylio app, you agree to be bound by these Terms of Service. If you do not agree to these Terms, please do not use the app.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Use of the App',
            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '1. Personal Use Only: Daylio is intended for personal use only. You may not use the app for commercial purposes.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 10,
          ),Text(
            '2. Data Privacy: You are responsible for the confidentiality and security of your data. Daylio cannot be held responsible for any unauthorized access to your personal information.',
            style: TextStyle(fontSize: 16.0),
          ),SizedBox(
            height: 10,
          ),Text(
            '3. Compliance with Laws and Regulations: You agree to comply with all applicable laws and regulations when using the app.',
            style: TextStyle(fontSize: 16.0),
          ),SizedBox(
            height: 10,
          ),Text(
            '4. User Content: You are fully responsible for the content you create and share through the app. You warrant that you have the right to publish such content and that it does not infringe upon the rights of third parties.',
            style: TextStyle(fontSize: 16.0),
          ),SizedBox(
            height: 20,
          ),Text(
            'Changes to the Terms',
            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),
          ),
          SizedBox(
            height: 10,
          ),Text(
            'Daylio reserves the right to modify these Terms of Service at any time. Changes will be posted on our website or through the app. Your continued use of the app after such changes constitutes your acceptance of the modified Terms.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 50,
          ),Text(
            'Contact',
            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),
          ),SizedBox(
            height: 10,
          ),Text(
            'If you have any questions or concerns regarding these Terms of Service, please contact us at contact@daylio.com.',
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
