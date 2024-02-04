import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: ElevatedButton(onPressed:()async{
            final _url = 'https://lms.umm.ac.id/';
            _launchUrl(url:_url,inApp: true);
          }, child: Text("pencet")),
        ),
      ),
    );
  }
Future<void> _launchUrl({required String url,bool inApp=false}) async {
    if (await canLaunch(url)) {
      await launch(url,forceWebView: inApp);
    }
  // Future<void> _launchUrl({required String url, bool inApp = false}) async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }else{
  //     await launch(url,forceWebView: inApp);
  //   }
  }
}
