import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type,Prams>{

   Future<Either<Failure,Type>> call(Prams prams);

}


class NoParams{
  
}