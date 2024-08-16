import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:convex_bottom_app_bar/convex_bottom_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _key = UniqueKey();
  late String initialUrl = "https://maloug.com";
  bool loading = true;
  int pprogress = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(
          children: [
            WebView(
                backgroundColor: Colors.black,
                initialUrl: initialUrl,
                javascriptMode: JavascriptMode.unrestricted,
                key: _key,
                onPageStarted: (String url) {
                  setState(() {
                    loading = true;
                  });
                },
                onProgress: (int progress) {
                  setState(() {
                    loading = true;
                    pprogress = progress;
                  });
                },
                onPageFinished: (String url) {
                  setState(() {
                    loading = false;
                  });
                }),
            pprogress == 100
                ? SizedBox()
                : Positioned(
                    top: 300,
                    left: 150,
                    child: LoadingAnimationWidget.beat(
                        color: Colors.lightGreen, size: 50),
                  )
          ],
        )));
  }
}
