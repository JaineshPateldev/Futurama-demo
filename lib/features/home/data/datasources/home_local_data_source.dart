import 'dart:convert';

import 'package:futurama/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/data/models/info_model.dart';
import '../../domain/entities/info.dart';


const INFO_KEY = "INFO";


abstract class HomeLocalDataSource{
  /// Gets the cached [Info] which we saved 
  /// else it will throws the [CacheException] for all error code 
  Future<InfoModel> getInfo();

  /// save the [Info] 
  /// else it will throws the [CacheException] for all error code 
  Future<bool> cacheInfo(InfoModel info);
  
}

 class HomeLocalDataSourceImpl implements HomeLocalDataSource{
   final SharedPreferences sharedPreferences;

  HomeLocalDataSourceImpl({required this.sharedPreferences});
  
  
  @override
  Future<bool> cacheInfo(InfoModel info) async {
      return sharedPreferences.setString(INFO_KEY, json.encode(info.toJson()));
    
  }

  @override
  Future<InfoModel> getInfo() {
    // TODO: implement getInfo
    final jsonString = sharedPreferences.getString(INFO_KEY);
    if(jsonString != null){
        return  Future.value(InfoModel.fromJson(json.decode(jsonString)));
    }else{
      throw CacheException();
    }

   }



 }