
import 'package:flutter/material.dart';
import 'package:futurama/features/character/presentation/page/characters_page.dart';
import 'package:futurama/features/character/presentation/page/character_datail_page.dart';
import 'package:futurama/features/home/presentation/page/home_page.dart';

import 'route_path.dart';
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    
      case RoutePaths.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );


    case RoutePaths.characters:
            return MaterialPageRoute(
              builder: (_) => const CharactersPage(),
      );

       case RoutePaths.charactersDetails:
        final data = settings.arguments; 
            return MaterialPageRoute(
              builder: (_) =>  CharacterDetailPage(char: data),
      );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
