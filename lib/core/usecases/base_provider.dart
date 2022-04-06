import 'package:flutter/cupertino.dart';

import '../ui/ui_state.dart';

class BaseProvider with ChangeNotifier{

    late UiState currentState;


    setErrorState(){
      currentState = UiState.error;
         notifyListeners();

    }


    setLoadingState(){
      currentState = UiState.loading;
         notifyListeners();

    }

    setLoadedState(){
      currentState = UiState.loaded;
         notifyListeners();

    }


}