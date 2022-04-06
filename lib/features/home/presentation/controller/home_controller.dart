import 'package:futurama/core/ui/ui_state.dart';
import 'package:futurama/core/usecases/usecase.dart';
import 'package:futurama/features/home/domain/entities/info.dart';

import '../../../../core/core_export.dart';
import '../../../../di_container.dart';
import '../../domain/usecases/get_info.dart';



class HomeController extends BaseProvider{


    Info? info;
   late String errorMessage;
   bool isLoading = true;

   HomeController(){
     currentState = UiState.none;
   }


 

    Future<void> getInfo() async {

       setLoadingState();

       final failureOrInfo  = await GetInfo(sl()).call(NoParams());
       

      
        failureOrInfo.fold(
          (failure){
            failureMessage(failure);
            setErrorState();
          },
          (info){
              
               this.info = info;
               setLoadedState();
              
          } 
        );
     
       
    }


    void failureMessage(Failure failure){
      switch(failure.runtimeType){
        case ServerFailure:
          errorMessage =  "Server Failurer";
          break;
        case CacheFailure:
            errorMessage =  "Cache Failure";
           break;
        default:
            errorMessage = "Unhandel Failure";
           break;
      }
    }
}
