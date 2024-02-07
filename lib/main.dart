import 'package:flutter/material.dart';
import 'package:language_translator/language_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Translator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: LanguageTranslatonPage(),
    );
  }
}
