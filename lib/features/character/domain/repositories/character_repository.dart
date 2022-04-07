import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/character.dart';

abstract class CharacterRepository{

  Future<Either<Failure, List<Character>>> getCharacters();

}