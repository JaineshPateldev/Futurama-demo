
import 'package:flutter/material.dart';
import 'package:futurama/features/character/presentation/page/characters_page.dart';
import 'package:futurama/features/character/presentation/page/character_datail_page.dart';
import 'package:futurama/features/home/presentation/page/home_page.dart';
import 'package:futurama/features/quiz/presentation/page/quiz_page.dart';

import 'route_path.dart';
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    
    case RoutePaths.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );


    case RoutePaths.charactersPage:
            return MaterialPageRoute(
              builder: (_) => const CharactersPage(),
      );

     case RoutePaths.charactersDetailsPage:
        final data = settings.arguments; 
      return MaterialPageRoute(
              builder: (_) =>  CharacterDetailPage(char: data),
      );
    
      case RoutePaths.quizPage:
        return MaterialPageRoute(
                builder: (_) => const QuizPage(),
        );


      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
