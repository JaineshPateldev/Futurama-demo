import 'package:flutter/cupertino.dart';

import '../ui/ui_state.dart';

class BaseProvider with ChangeNotifier{

    late UiState currentState;


    setErrorState() async{
      currentState = UiState.error;
      await Future.delayed(const Duration(milliseconds: 1)); 
         notifyListeners();

    }


    setLoadingState() async {
      
      currentState = UiState.loading;
      await Future.delayed(const Duration(milliseconds: 1)); 
         notifyListeners();

    }

    setLoadedState() async{
      currentState = UiState.loaded;
       await Future.delayed(const Duration(milliseconds: 1)); 
         notifyListeners();

    }


}