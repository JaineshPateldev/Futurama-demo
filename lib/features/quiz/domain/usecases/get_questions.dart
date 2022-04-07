
import 'package:dartz/dartz.dart';
import 'package:futurama/core/error/failures.dart';
import 'package:futurama/core/usecases/usecase.dart';
import 'package:futurama/features/quiz/domain/entities/question.dart';

import '../repositories/quiz_repository.dart';

class GetQuestions implements UseCase <List<Question> ,NoParams>{

  final QuizRepository repository;

  GetQuestions(this.repository);

  @override
  Future<Either<Failure, List<Question>>> call(NoParams prams) async {
   
     return await repository.getQuestions();
  }


}
