import 'package:dartz/dartz.dart';
import 'package:futurama/core/error/failures.dart';
import 'package:futurama/core/usecases/usecase.dart';
import 'package:futurama/features/home/domain/entities/info.dart';
import 'package:futurama/features/home/domain/repositories/home_repository.dart';
import 'package:futurama/features/home/domain/usecases/get_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';



class MockHomeRepository extends Mock implements HomeRepository{


} 

 main(){

     late GetInfo? usecase;
     late MockHomeRepository? mockHomeRepository;

      setUp((){

        mockHomeRepository= MockHomeRepository();
        usecase = GetInfo(mockHomeRepository!);
        
      });

      late final creators = [Creators(name: "User 1" , url: "http://google.com") , Creators(name: "User 2" , url: "http://google.com")];
      late final info = Info(synopsis: "this is the test code ", id: 1 , yearsAired: "1999–2013" ,creators: creators);

      // prints(info.toJson().toString());

        test("check get Info for home Screen", 
          () async{
            // arrange 
            

            // // assert
            // expect(result, Right(info));
            // verify(mockHomeRepository?.getInfo());
            // verifyNoMoreInteractions(mockHomeRepository);

          }
        );
    }

