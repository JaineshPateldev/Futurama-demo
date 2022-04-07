import 'package:flutter/material.dart';
import 'package:futurama/features/character/presentation/controller/character_controller.dart';
import 'package:futurama/features/home/presentation/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'core/core_export.dart';
import 'di_container.dart' as di;
import 'di_container.dart';
import 'features/routing/route_path.dart';
import 'features/routing/router.dart' as router;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
     await di.init();
    
  } catch (e) {
    
  }
  
  
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => CharacterController()),
      ],
      child:  const MyApp(),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        navigatorKey: sl<NavigationService>().navigatorKey,
        onGenerateRoute: router.Router.generateRoute,
       initialRoute: RoutePaths.home,
        
    );
  }
}
