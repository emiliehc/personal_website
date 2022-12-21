import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';

const versionText = "Dernière mise à jour : mercredi 21 déc 2022 00 h 19 HNE";

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: const Text(
          versionText,
          style: TextStyle(
            fontSize: 5,
            backgroundColor: Color(0xFF2D2922),
            color: Colors.white,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
                padding: const EdgeInsets.all(40),
                color: Colors.white,
                child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: MaxColumnWidth(
                        FractionColumnWidth(0.2), FixedColumnWidth(150)),
                    1: MaxColumnWidth(
                        FixedColumnWidth(5), FractionColumnWidth(0.04)),
                    2: MaxColumnWidth(
                        FractionColumnWidth(0.2), FixedColumnWidth(150)),
                  },
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                          child: const Text(
                            'Welcome to Emilie Chen\'s personal website',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(),
                        Container(
                          child: const Text(
                            'Bienvenue au site web personnel d\'Emilie Chen',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: TextButton(
                            child: const Text('English'),
                            onPressed: () {
                              Navigator.pushNamed(context, MainPage.routeEn,
                                  arguments:
                                  MainPageArguments(language: Language.en));
                            },
                          ),
                        ),
                        Container(),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: TextButton(
                            child: const Text('Français'),
                            onPressed: () {
                              Navigator.pushNamed(context, MainPage.routeFr,
                                  arguments:
                                  MainPageArguments(language: Language.fr));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )),

          ),
        ));
  }
}
