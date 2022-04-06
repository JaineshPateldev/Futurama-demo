
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:futurama/core/util/network_info.dart';
import 'package:futurama/features/home/data/datasources/home_local_data_source.dart';
import 'package:futurama/features/home/data/datasources/home_remote_data_source.dart';
import 'package:futurama/features/home/presentation/controller/home_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_info.dart';


final sl = GetIt.instance;

Future<void> init() async {


  //! External
  initExternal();


  //! Core 
  initCore();


  //! Common Module
  


  //! Features

  //! Home Module
  initHomeModule();




}

void initExternal() async{

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


void initCore(){

   // Network Checker 
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));


}

void initHomeModule(){

  




  // Remote Data Source
  sl.registerLazySingleton<HomeRemoteDataSource>(() =>HomeRemoteDataSourceImpl(client: sl<http.Client>()));

 // Local Data Source
  sl.registerLazySingleton<HomeLocalDataSource>(() =>HomeLocalDataSourceImpl(sharedPreferences: sl()));


  // Repo
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));


  // UseCase
  sl.registerLazySingleton(() => GetInfo(sl()));



  
}