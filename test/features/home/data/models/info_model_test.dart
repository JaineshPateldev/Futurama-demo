import 'package:flutter_test/flutter_test.dart';
import 'package:futurama/features/home/domain/entities/info.dart';
import 'package:futurama/features/home/data/models/info_model.dart';

void main(){

      late final creators = [Creators(name: "User 1" , url: "http://google.com") , Creators(name: "User 2" , url: "http://google.com")];
      late final infoModel = InfoModel(synopsis: "this is the test code ", id: 1 , yearsAired: "1999–2013" ,creators: creators);


      test(
        "Subclass of the  Info entity", (){

            expect(infoModel, isA<Info>());
           

        });
}