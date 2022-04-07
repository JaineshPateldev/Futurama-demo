import 'package:flutter/cupertino.dart';
import 'package:futurama/core/error/exception.dart';
import 'package:futurama/core/util/network_info.dart';
import '../datasources/quiz_local_data_source.dart';
import '../datasources/quiz_remote_data_source.dart';
import '../../domain/entities/question.dart';

import 'package:futurama/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository{

    final QuizRemoteDataSource remoteDataSource;
    final QuizLocalDataSource localDataSource;
    final NetworkInfo networkInfo;

  QuizRepositoryImpl( {required this.remoteDataSource,required this.localDataSource,required this.networkInfo }):super();
  
  @override
  Future<Either<Failure, List<Question>>> getQuestions() async{

    if(await networkInfo.isConnected){
      try {
        final lstQuestions = await remoteDataSource.getQuestions();
      
        return Right(lstQuestions);
        
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
          return Left(NetworkFailure());
    }
   
  }

  
}