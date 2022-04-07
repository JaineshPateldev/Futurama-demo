import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:futurama/core/error/exception.dart';
import 'package:futurama/features/character/data/models/character_model.dart';
import 'package:futurama/features/home/data/models/info_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/constant.dart';

import 'package:http/http.dart' as http;

import '../../domain/entities/character.dart';

abstract class CharacterRemoteDataSource{
  /// Calls the https://api.sampleapis.com/futurama/characters/
  /// else it will throws the [ServerException] for all error code 
 
  Future<List<CharacterModel>> getCharacters();
}


class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource{

  final http.Client client;
  

  Map<String,String> headers = HashMap();


  CharacterRemoteDataSourceImpl({required this.client}){
      headers.putIfAbsent("Content-Type", () => ContentType.json.value);
  }


  @override
  Future<List<CharacterModel>> getCharacters() async {
     var url = Uri.parse(Constant.BASE_URL + Constant.GET_CHARACTERS);
      

    final res = await client.get(url,
      headers: headers
    );
    
    if(res.statusCode == 200){
       
      final lst =  json.decode(res.body).map((v) => CharacterModel.fromJson(v)).toList().cast<CharacterModel>();

      return lst;
    }else{
      throw ServerException();
    }
  }
}