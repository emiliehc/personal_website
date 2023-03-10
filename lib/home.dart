import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:personal_website/translation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cv.dart';
import 'main.dart';

class MainPageArguments {
  final Language language;

  MainPageArguments({this.language = Language.fr});
}

bool languageSet = false;
Language globalLanguage = Language.fr;

void setLanguage(Language language) {
  globalLanguage = language;
  languageSet = true;
}

Future<bool> launchWebsite(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    return await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeEn = '/home';
  static const String routeFr = '/accueil';

  @override
  Widget build(BuildContext context) {
    if (!languageSet) {
      final Object? argsObj = ModalRoute.of(context)?.settings.arguments;
      if (argsObj != null) {
        final args = argsObj as MainPageArguments;
        setLanguage(args.language);
      } else {
        setLanguage(Language.fr);
      }
    }
    return Title(
        color: Colors.white,
        title: translateText(WebText.home),
        child: Scaffold(
          body: Center(
              child: Container(
                  width: 700,
                  padding: const EdgeInsets.all(30),
                  child: Table(children: <TableRow>[
                    const TableRow(children: [
                      Text(
                        "Emilie Chen",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )
                    ]),
                    TableRow(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                        ),
                      ],
                    ),
                    TableRow(children: [
                      Text(
                        translateText(WebText.welcomeMessage),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ]),
                    TableRow(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                        ),
                      ],
                    ),
                    TableRow(children: [
                      Row(
                        children: [
                          IconButton(
                            padding: const EdgeInsets.all(10),
                            onPressed: () {
                              Navigator.pushNamed(context, CVPage.route);
                            },
                            icon: const Icon(Entypo.text_document),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(10),
                            onPressed: () async {
                              final uri = Uri(
                                scheme: 'mailto',
                                path: 'emilie.hongjun.chen@mail.mcgill.ca',
                              );
                              await launchWebsite(uri);
                            },
                            icon: const Icon(Icons.email),
                          ),
                          IconButton(
                              padding: const EdgeInsets.all(10),
                              onPressed: () {
                                launchWebsite(Uri(
                                  scheme: 'https',
                                  host: 'github.com',
                                  path: 'emiliehc',
                                ));
                              },
                              icon: const Icon(FontAwesome.github)),
                          IconButton(
                              padding: const EdgeInsets.all(10),
                              onPressed: () {
                                launchWebsite(Uri(
                                  scheme: 'https',
                                  host: 'linkedin.com',
                                  path: 'in/emilie-h-c',
                                ));
                              },
                              icon: const Icon(FontAwesome.linkedin)),
                          IconButton(
                              padding: const EdgeInsets.all(10),
                              onPressed: () {
                                launchWebsite(Uri(
                                  scheme: 'https',
                                  host: 'emiliehc.itch.io',
                                ));
                              },
                              icon: const Icon(FontAwesome.gamepad)),
                        ],
                      )
                    ])
                  ]))),
        ));
  }
}
