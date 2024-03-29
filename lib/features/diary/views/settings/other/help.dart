import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  final String supportEmail = 'support@daylio.com';
  final String twitterUrl = 'https://twitter.com/daylioapp';
  final String facebookUrl = 'https://www.facebook.com/daylioapp';
  final String privacyPolicyUrl = 'https://daylio.com/privacy-policy/';

  const HelpPage({super.key});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      var bool = await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daylio Help'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Contact Support via Email'),
            onTap: () {
              _launchURL('mailto:$supportEmail');
            },
          ),
          const ListTile(
            title: Text('Social Media'),
            subtitle: Text('Follow us for updates and support'),
          ),
          ListTile(
            title: const Text('Twitter'),
            onTap: () {
              _launchURL(twitterUrl);
            },
          ),
          ListTile(
            title: const Text('Facebook'),
            onTap: () {
              _launchURL(facebookUrl);
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              _launchURL(privacyPolicyUrl);
            },
          ),
        ],
      ),
    );
  }
}