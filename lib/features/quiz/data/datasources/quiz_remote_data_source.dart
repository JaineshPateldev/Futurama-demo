import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:futurama/core/error/exception.dart';
import '../models/question_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/util/constant.dart';

abstract class QuizRemoteDataSource{
  /// Calls the https://api.sampleapis.com/futurama/questions/
  /// else it will throws the [ServerException] for all error code 
  Future<List<QuestionModel>>  getQuestions();
  
}


class QuizRemoteDataSourceImpl implements QuizRemoteDataSource{

  final http.Client client;
  

  Map<String,String> headers = HashMap();


  QuizRemoteDataSourceImpl({required this.client}){
      headers.putIfAbsent("Content-Type", () => ContentType.json.value);
  }




  @override
  Future<List<QuestionModel>> getQuestions() async {
  
    var url = Uri.parse(Constant.BASE_URL + Constant.GET_QUIZ);
      

    final res = await client.get(url,
      headers: headers
    );
    
    if(res.statusCode == 200){
      // creators.map((v) => v.toJson()).toList();
      return json.decode(res.body).map((v) => QuestionModel.fromJson(v)).toList().cast<QuestionModel>();
    }else{
      throw ServerException();
    }

  }
}