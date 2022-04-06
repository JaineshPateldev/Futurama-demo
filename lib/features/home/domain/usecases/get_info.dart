
import 'package:dartz/dartz.dart';
import 'package:futurama/core/error/failures.dart';
import 'package:futurama/core/usecases/usecase.dart';

import '../entities/info.dart';
import '../repositories/home_repository.dart';

class GetInfo implements UseCase <Info ,NoParams>{

  final HomeRepository repository;

  GetInfo(this.repository);

  @override
  Future<Either<Failure, Info>> call(NoParams prams) async {
   
     return await repository.getInfo();
  }


}
