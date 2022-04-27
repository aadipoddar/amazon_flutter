import 'package:amazon_flutter/utils/color_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: Scaffold(
        body: const Text('Amazon'),
      ),
    );
  }
}