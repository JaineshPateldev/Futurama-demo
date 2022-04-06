import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/info.dart';

abstract class HomeRepository{

  Future<Either<Failure, Info>> getInfo();

}