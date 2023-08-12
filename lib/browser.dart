import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'floating_button/floating_bubble.dart';
import 'package:provider/provider.dart';
import 'models/webview_model.dart';
import 'webview_window.dart';

class Browser extends StatefulWidget {
  const Browser({Key? key}) : super(key: key);

  @override
  State<Browser> createState() => _BrowserState();
}

class _BrowserState extends State<Browser> with SingleTickerProviderStateMixin {
  var msgString = "";

  void getDeviceToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print("디바이스 토큰 : $token");
  }

  @override
  void initState() {
    getDeviceToken();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // precacheImage(const AssetImage("assets/icon/icon.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBrowser();
  }

  Widget _buildBrowser() {
    var webViewModel = Provider.of<WebViewModel>(context, listen: false);

    return Scaffold(
      body: WebViewWindow(webViewModel: webViewModel),
      floatingActionButton: const FloatingBubble(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
