import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:personal_website/translation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class MainPageArguments {
  final Language language;

  MainPageArguments({this.language = Language.fr});
}

Language globalLanguage = Language.fr;

Future<bool> launchWebsite(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    return await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String route = '/accueil';

  @override
  Widget build(BuildContext context) {
    final Object? argsObj = ModalRoute.of(context)?.settings.arguments;
    if (argsObj != null) {
      final args = argsObj as MainPageArguments;
      globalLanguage = args.language;
    } else {
      globalLanguage = Language.fr;
    }
    return Scaffold(
      body: Center(
        child: Container(
          width: 700,
          padding: const EdgeInsets.all(30),
          child: Table(
            children: <TableRow> [
              const TableRow(
                children: [
                  Text(
                    "Emilie Chen",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  )
                ]
              ),
              TableRow(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    translateText(WebText.welcomeMessage),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ]
              ),
              TableRow(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          launchWebsite(
                            Uri.parse("https://www.linkedin.com/in/emilie-h-c/overlay/1635502840992/single-media-viewer/")
                          );
                        },
                        icon: const Icon(Entypo.text_document),
                      ),
                      IconButton(
                        onPressed: () async {
                          final uri = Uri(
                            scheme: 'mailto',
                            path: 'emilie.hongjun.chen@mail.mcgill.ca',
                          );
                          await launchWebsite(uri);
                        },
                        icon: const Icon(Icons.email),
                      ),
                      IconButton(onPressed: () {
                        launchWebsite(Uri(
                          scheme: 'https',
                          host: 'github.com',
                          path: 'emiliehc',
                        ));
                      }, icon: const Icon(FontAwesome.github)),
                      IconButton(onPressed: () {
                        launchWebsite(Uri(
                          scheme: 'https',
                          host: 'linkedin.com',
                          path: 'in/emilie-h-c',
                        ));
                      }, icon: const Icon(FontAwesome.linkedin)),
                    ],
                  )
                ]
              )
            ]
          )
        )
      ),
    );
  }
}