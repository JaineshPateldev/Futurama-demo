
import 'package:dartz/dartz.dart';
import 'package:futurama/core/error/failures.dart';
import 'package:futurama/core/usecases/usecase.dart';
import 'package:futurama/features/character/domain/entities/character.dart';

import '../repositories/character_repository.dart';


class GetCharacters implements UseCase <List<Character> ,NoParams>{

  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(NoParams prams) async {
   
     return await repository.getCharacters();
  }


}
