import 'package:flutter/cupertino.dart';
import 'package:futurama/core/error/exception.dart';
import 'package:futurama/core/util/network_info.dart';
import 'package:futurama/features/home/data/datasources/home_local_data_source.dart';
import 'package:futurama/features/home/data/datasources/home_remote_data_source.dart';
import 'package:futurama/features/home/domain/entities/info.dart';

import 'package:futurama/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{

    final HomeRemoteDataSource remoteDataSource;
    final HomeLocalDataSource localDataSource;
    final NetworkInfo networkInfo;

  HomeRepositoryImpl( {required this.remoteDataSource,required this.localDataSource,required this.networkInfo }):super();
  
  @override
  Future<Either<Failure, Info>> getInfo() async{

    if(await networkInfo.isConnected){
      try {
        final info = await remoteDataSource.getInfo();
        localDataSource.cacheInfo(info);
        return Right(info);
        
      } on ServerException{
        return Left(ServerFailure());
      }

    }else{
        try {

          final info = await localDataSource.getInfo();
          return Right(info);
          
        } on CacheException{
            return Left(CacheFailure());
        }

    }
   
  }

  
}