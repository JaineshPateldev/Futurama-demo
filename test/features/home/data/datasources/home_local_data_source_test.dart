import 'dart:convert';
import 'dart:io';

import 'package:futurama/core/error/exception.dart';
import 'package:futurama/features/home/data/datasources/home_local_data_source.dart';
import 'package:futurama/features/home/data/models/info_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../json/file_reader.dart';


class MockSharedPreferences extends Mock implements SharedPreferences{}


void main(){

HomeLocalDataSourceImpl?  localDataSourceImpl;
SharedPreferences? mockSharedPreferences;

  setUp((){
      mockSharedPreferences = MockSharedPreferences();
        localDataSourceImpl = HomeLocalDataSourceImpl(sharedPreferences: mockSharedPreferences!);
  });



  group("Get Data from SharedPreferences", (){

        final tInfoModel = InfoModel.fromJson(json.decode(fileReader("info.json")));
        test("Should return Data if present in cache", () async {
         
          when(mockSharedPreferences!.getString(INFO_KEY)).thenReturn(fileReader("info.json"));


          final result = await localDataSourceImpl!.getInfo();


          expect(result, isA<InfoModel>());

          final String? jsonString = mockSharedPreferences?.getString(INFO_KEY);
          expect(InfoModel.fromJson(json.decode(jsonString!)), isA<InfoModel>());
        
         });


        test("Should throws a CacheException when there is no Value", () async {
         
          when(mockSharedPreferences!.getString(INFO_KEY)).thenReturn(null);


          final call = localDataSourceImpl!.getInfo;
          
          expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
        });

  }
  );

}
