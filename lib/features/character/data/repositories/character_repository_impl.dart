
import 'package:futurama/core/error/exception.dart';
import 'package:futurama/core/util/network_info.dart';

import 'package:futurama/core/error/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:futurama/features/character/data/models/character_model.dart';
import 'package:futurama/features/character/domain/entities/character.dart';

import '../../domain/repositories/character_repository.dart';
import '../datasources/character_local_data_source.dart';
import '../datasources/character_remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository{

    final CharacterRemoteDataSource remoteDataSource;
    final CharacterLocalDataSource localDataSource;
    final NetworkInfo networkInfo;

  CharacterRepositoryImpl( {required this.remoteDataSource,required this.localDataSource,required this.networkInfo }):super();
  
  

  @override
  Future<Either<Failure, List<Character>>> getCharacters() async {
     if(await networkInfo.isConnected){
      try {
        final lstCharacterModel = await remoteDataSource.getCharacters();
      
        return Right(lstCharacterModel);
        
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
          return Left(NetworkFailure());
    }
  }

  
}