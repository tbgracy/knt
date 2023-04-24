import 'package:flutter/material.dart';
import 'package:knt/theme_data.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Knt',
      theme: themeData,
      home: HomePage(),
    );
  }
}
