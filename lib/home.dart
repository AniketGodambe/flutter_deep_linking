import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deep_linking/navigation_screen.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  String deepLink = '';
  PendingDynamicLinkData? deepLinkBackgroundData;

  @override
  void initState() {
    void initDynamicLinks() async {
      deepLinkBackgroundData =
          await FirebaseDynamicLinks.instance.getInitialLink();
      deepLinkBackgroundData =
          await FirebaseDynamicLinks.instance.getInitialLink();
      deepLink = deepLinkBackgroundData!.link.toString();
      final type = deepLink.split('/').last;
      if (GetPlatform.isAndroid) {
        Future.delayed(const Duration(seconds: 2), () {
          Get.to(() => const NavigationScreen());
        });
      } else {
        Get.to(() => const NavigationScreen());
      }

      dynamicLinks.onLink.listen((dynamicLinkData) {
        log("App is on in backbround");
        final uri = dynamicLinkData.link.toString();
        log(uri.toString());
        final type = uri.split('/').last;
        log("deeplink $type");

        Get.to(() => const NavigationScreen());
      });
    }

    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const NavigationScreen());
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
