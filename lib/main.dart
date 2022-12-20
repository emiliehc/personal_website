import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/cv.dart';
import 'package:personal_website/home.dart';

import 'landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome / Bienvenue',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        MainPage.routeEn: (context) {
          setLanguage(Language.en);
          return const MainPage();
        },
        MainPage.routeFr: (context) {
          setLanguage(Language.fr);
          return const MainPage();
        },
        CVPage.route: (context) {
          return const CVPage();
        },
      },
    );
  }
}

enum Language { en, fr }
