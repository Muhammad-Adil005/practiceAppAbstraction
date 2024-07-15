import 'package:flutter/material.dart';
import 'package:practice_app_abstctdp/ui/home_page.dart';

import 'Di/locator.dart';

void main() {
  setupLocator(); // We have to declared the setUpLocator here at the top of the App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:
          'Abstraction and Dependency Injection App using Dio and http packages and Get IT package',
      home: HomePage(),
    );
  }
}
