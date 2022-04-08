import 'package:flutter/material.dart';
import 'package:futurama/features/character/presentation/controller/character_controller.dart';
import 'package:futurama/features/home/presentation/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'core/core_export.dart';
import 'core/ui/language/app_language_controller.dart';
import 'core/ui/language/app_localizations.dart';
import 'core/ui/themes/theme_controller.dart';
import 'core/ui/themes/theme_data_constant.dart';
import 'di_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/quiz/presentation/controller/quiz_controller.dart';
import 'features/routing/route_path.dart';
import 'features/routing/router.dart' as router;
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
     await di.init();
  
  
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => CharacterController()),
        ChangeNotifierProvider(create: (_) => QuizController()),
        ChangeNotifierProvider(create: (_) => ThemeController(localDataSource: sl())),
        ChangeNotifierProvider(create: (_) => AppLanguageController(localDataSource: sl())),
      ],
      child: Phoenix(
         child:const MyApp(),
      )
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   


    return MaterialApp(
      title: 'Flutter Demo',
       theme: context.watch<ThemeController>().currentTheme ? ThemeDataConstant.dark : ThemeDataConstant.light,
        navigatorKey: sl<NavigationService>().navigatorKey,
        onGenerateRoute: router.Router.generateRoute,
       initialRoute: RoutePaths.homePage,
       locale: context.watch<AppLanguageController>().currentAppLocal,
       localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', ''),
        ],
       localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            print(supportedLocale.languageCode);
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
            
          }
          return supportedLocales.first;
        },
    );
  }
}
