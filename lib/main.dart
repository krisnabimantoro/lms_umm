import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LMS'),
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
        ),
        body: InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse('https://lms.umm.ac.id/')),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var uri = navigationAction.request.url;

            if (uri != null && uri.toString().endsWith('.pdf')) {
              // If the URL ends with '.pdf', open it in the default browser
              if (await canLaunch(uri.toString())) {
                await launch(uri.toString());
                return NavigationActionPolicy
                    .CANCEL; // Cancel the navigation in the InAppWebView
              } else {
                throw 'Could not launch $uri';
              }
            }

            return NavigationActionPolicy
                .ALLOW; // Allow the navigation to continue in the InAppWebView
          },
        ),
      ),
    );
  }
}
