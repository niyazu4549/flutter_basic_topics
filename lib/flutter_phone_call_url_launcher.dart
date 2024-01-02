import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/utiles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterPhoneCallUrlLauncher extends StatefulWidget {
  const FlutterPhoneCallUrlLauncher({super.key});

  @override
  State<FlutterPhoneCallUrlLauncher> createState() => _FlutterPhoneCallUrlLauncherState();
}

class _FlutterPhoneCallUrlLauncherState extends State<FlutterPhoneCallUrlLauncher> {
  String url= 'tel: +99364921507';

  // Future<void> call() async{
  //   if(await canLaunchUrl(url)){
  //     await launch(url);
  //   }else{
  //     throw 'Could not launch $url';
  //   }
  // }

  //launch method

  Future<void> _launchUrl(Uri uri) async{
    if(!await launchUrl(uri)){
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                final Uri url = Uri(
                    scheme: 'tel',
                    path: '+917799585022'
                );
                _launchUrl(url);
              },
              child: const Text('Launch phone app'),
            ),
            ElevatedButton(
              onPressed: (){
                final Uri url = Uri(
                    scheme: 'sms',
                    path: '+917799585022'
                );
                _launchUrl(url);
              },
              child: const Text('Launch sms app'),
            ),
          ],
        ),
      )
    );
  }
}

