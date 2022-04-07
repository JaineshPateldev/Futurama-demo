import 'package:dartz/dartz.dart';
import 'package:futurama/features/quiz/domain/entities/question.dart';

import '../../../../core/error/failures.dart';

abstract class QuizRepository{

  Future<Either<Failure, List<Question>>>  getQuestions();

}