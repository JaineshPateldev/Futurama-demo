
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:futurama/core/util/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
class MockConnectivityChecker extends Mock implements DataConnectionChecker{
  
}
void main(){
  NetworkInfoImpl? networkInfoImpl;
  MockConnectivityChecker? mockConnectivityChecker;


  setUp((){

    mockConnectivityChecker = MockConnectivityChecker();
    networkInfoImpl = NetworkInfoImpl( dataConnectionChecker: mockConnectivityChecker!);

  });

  group('isConnected ', () {
   

   test("Should forward the call to check connection", () async{
   
      //verify(networkInfoImpl!.isConnected);
   });
 

  });
}