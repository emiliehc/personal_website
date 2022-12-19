import 'package:tuple/tuple.dart';

import 'home.dart';
import 'main.dart';

enum WebText {
  welcomeMessage,
}

const Map<WebText, String> webTextEn = {
  WebText.welcomeMessage: 'Hello, my name is Emilie Chen and I am a third '
      'year (U2) computer science student at McGill University. I\'m interested '
      'in programming and game development. Here\'s my CV and some of the '
      'projects that I\'m proud of.\n'
      'If you are interested in contacting me, don\'t hesitate to shoot me a'
      'message on LinkedIn or reach me via email.'
};

const Map<WebText, String> webTextFr = {
  WebText.welcomeMessage: 'Salut, je m\'appelle Emilie Chen et je suis une '
      'étudiante en troisième année (U2) en informatique à l\'Université '
      'McGill. Je m\'intéresse à la programmation et au développement de '
      'jeux vidéo. Voici mon CV et quelques-uns de mes projets dont je '
      'suis fière. \n'
      'Si vous êtes intéressé·e à me contacter, n\'hésitez pas à '
      'me laisser un message sur LinkedIn ou par courriel.',
};

String translateText(WebText text) {
  switch (globalLanguage) {
    case Language.en:
      return webTextEn[text]!;
    case Language.fr:
      return webTextFr[text]!;
  }
}