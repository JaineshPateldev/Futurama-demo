
import 'package:futurama/core/usecases/usecase.dart';
import 'package:futurama/features/character/domain/entities/character.dart';
import 'package:futurama/features/home/domain/entities/info.dart';

import '../../../../core/core_export.dart';
import '../../../../di_container.dart';
import '../../domain/usecases/get_characters.dart';



class CharacterController extends BaseProvider{


   List<Character>? characters;
   late String errorMessage;
   bool isLoading = true;

   CharacterController(){
     currentState = UiState.none;
   }


 

    Future<void> getCharacters() async {

       setLoadingState();

       final failureOrCharacters  = await GetCharacters(sl()).call(NoParams());
       

      
        failureOrCharacters.fold(
          (failure){
            failureMessage(failure);
            setErrorState();
          },
          (characters){
              
               this.characters = characters ;
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
