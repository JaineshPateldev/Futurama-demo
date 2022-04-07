
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:futurama/features/character/data/datasources/character_local_data_source.dart';
import 'package:futurama/features/character/data/datasources/character_remote_data_source.dart';
import 'package:futurama/features/character/domain/usecases/get_characters.dart';
import 'package:futurama/features/home/data/datasources/home_local_data_source.dart';
import 'package:futurama/features/home/data/datasources/home_remote_data_source.dart';
import 'package:futurama/features/quiz/domain/usecases/get_questions.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/core_export.dart';
import 'features/character/data/repositories/character_repository_impl.dart';
import 'features/character/domain/repositories/character_repository.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_info.dart';
import 'features/quiz/data/datasources/quiz_local_data_source.dart';
import 'features/quiz/data/datasources/quiz_remote_data_source.dart';
import 'features/quiz/data/repositories/quiz_repository_impl.dart';
import 'features/quiz/domain/repositories/quiz_repository.dart';


final sl = GetIt.instance;

Future<void> init() async {



  

  //! Common Module
  


  //! Features

  //! Home Module
  await initHomeModule();
  await initCharacterModule();
  await initQuizModule();

  //! Core
   initCore();


  //! External
   // Local storage Key-Value
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);


  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  // sl.registerLazySingleton(()=>packageInfo);

  // Http For API call
  sl.registerLazySingleton(() => http.Client());


  // Data Connetion checker 
  sl.registerLazySingleton(()=>DataConnectionChecker() );



}

 initExternal() async{

  

}


 initCore(){

   // Network Checker 
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  
  sl.registerLazySingleton(() => NavigationService());

  


}

 initHomeModule() async{

  // Remote Data Source
  sl.registerLazySingleton<HomeRemoteDataSource>(() =>HomeRemoteDataSourceImpl(client: sl()));

 // Local Data Source
  sl.registerLazySingleton<HomeLocalDataSource>(() =>HomeLocalDataSourceImpl(sharedPreferences: sl()));


  // Repo
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));


  // UseCase
  sl.registerLazySingleton(() => GetInfo(sl()));

}

 initCharacterModule(){
   

  // Remote Data Source
  sl.registerLazySingleton<CharacterRemoteDataSource>(() =>CharacterRemoteDataSourceImpl(client:sl()));

  // Local Data Source
 
  sl.registerLazySingleton<CharacterLocalDataSource>(() =>CharacterLocalDataSourceImpl());


  // Repo
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));


  // UseCase
  sl.registerLazySingleton(() => GetCharacters(sl()));
}

initQuizModule(){
   

  // Remote Data Source
  sl.registerLazySingleton<QuizRemoteDataSource>(() =>QuizRemoteDataSourceImpl(client:sl()));

  // Local Data Source
 
  sl.registerLazySingleton<QuizLocalDataSource>(() =>QuizLocalDataSourceImpl());


  // Repo
  sl.registerLazySingleton<QuizRepository>(() => QuizRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));


  // UseCase
  sl.registerLazySingleton(() => GetQuestions(sl()));
}


 