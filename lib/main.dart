// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'downloadService.dart';

void main() async {
  runApp(const MaterialApp(home: WebView()));
}

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController controller;
  bool downloading = false;
  var progressString = "";
  var file = "";

  @override
  initState() {
    super.initState();

    // #docregion webview_controller
    controller = WebViewController()
      ..addJavaScriptChannel('imgDownload',
          onMessageReceived: (JavaScriptMessage message) {
        String imageUrl = message.message;
        _showDownloadDialog(context, imageUrl);
      })
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent("random")
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            print("pageStart: $url");
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print(request.url);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('http://14.52.220.140:8000/'));
    // #enddocregion webview_controller
  }

  // #docregion webview_widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WillPopScope(
              child: WebViewWidget(controller: controller),
              onWillPop: () => _goBack(context))),
    );
  }

  // #enddocregion webview_widget
  Future<bool> _goBack(BuildContext context) async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void _showDownloadDialog(BuildContext context, String url) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: const Text("이미지를 다운로드 하실건가요?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    print("url: $url");
                    _downloadFile(url);
                  },
                  child: const Text("예")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("아니오")),
            ],
          );
        });
  }

  Future<void> _downloadFile(String url) async {
    MobileDownloadService downloadService = MobileDownloadService();
    await downloadService.download(url: url);
  }
}
