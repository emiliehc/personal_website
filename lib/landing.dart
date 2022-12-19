import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
            color: Colors.white,
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(230),
                1: FixedColumnWidth(75),
                2: FixedColumnWidth(230),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      child: const Text(
                        'Welcome to Emilie Chen\'s personal website',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(),
                    Container(
                      child: const Text(
                        'Bienvenue au site web personnel d\'Emilie Chen',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        child: const Text('English'),
                        onPressed: () {
                          Navigator.pushNamed(context, MainPage.route,
                              arguments:
                                  MainPageArguments(language: Language.en));
                        },
                      ),
                    ),
                    Container(),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        child: const Text('Français'),
                        onPressed: () {
                          Navigator.pushNamed(context, MainPage.route,
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
