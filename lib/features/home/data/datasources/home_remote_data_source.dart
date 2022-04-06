import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:futurama/core/error/exception.dart';
import 'package:futurama/features/home/data/models/info_model.dart';

import '../../../../core/util/constant.dart';

import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource{
  /// Calls the https://api.sampleapis.com/futurama/info/
  /// else it will throws the [ServerException] for all error code 
  Future<InfoModel> getInfo();
  
}


class HomeFireBaseSourceImpl implements HomeRemoteDataSource{
  @override
  Future<InfoModel> getInfo() {
    // TODO: implement getInfo
    throw UnimplementedError();
  }
  
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{

  final http.Client client;
  

  Map<String,String> headers = HashMap();


  HomeRemoteDataSourceImpl({required this.client}){
      headers.putIfAbsent("Content-Type", () => ContentType.json.value);
  }




  @override
  Future<InfoModel> getInfo() async {
  
    var url = Uri.parse(Constant.BASE_URL + Constant.GET_INFO);
      

    final res = await client.get(url,
      headers: headers
    );
    
    if(res.statusCode == 200){
      // creators.map((v) => v.toJson()).toList();
      return InfoModel.fromJson(json.decode(res.body)[0]);
    }else{
      throw ServerException();
    }

  }
}