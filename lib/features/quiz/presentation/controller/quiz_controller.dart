import 'dart:collection';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:futurama/core/usecases/usecase.dart';
import 'package:futurama/features/quiz/domain/entities/question.dart';

import '../../../../core/core_export.dart';
import '../../domain/usecases/get_questions.dart';



class QuizController extends BaseProvider{


 List<Question>? questions;
  int? numberOfQuestionInQuiz = 6;
    HashMap<int,Question> mapOfQuestion =HashMap();

   late String errorMessage;
   bool isLoading = true;


   int? currentQuestion=1;

   QuizController(){
     currentState = UiState.none;
   }


 

    Future<void> getQuestions() async {
   
       setLoadingState();

       final failureOrInfo  = await GetQuestions(sl()).call(NoParams());
       

      
        failureOrInfo.fold(
          (failure){
            failureMessage(failure);
            setErrorState();
          },
          (questions) async {
            this.questions = [];
              if(numberOfQuestionInQuiz! >= questions.length){
                  numberOfQuestionInQuiz =questions.length;
              }
             await  settingUp(questions);
              setLoadedState();
          } 
        );
    }

    Future<void> settingUp(questions){
    
            final _random = Random();
               for(int i = 0 ; i <= numberOfQuestionInQuiz! ; i++){
                    Question question = questions[_random.nextInt(questions.length)];
                    if(!mapOfQuestion.containsKey(question.id)){
                        this.questions?.add(question);
                        mapOfQuestion.putIfAbsent(question.id!, () => question);
                    }else{
                      i--;
                    }
                  }
       return Future.value();
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

   String?  getSelectedAns({required int? questionId}) => mapOfQuestion[questionId]?.selectedAns ?? '';


    void selectedOption({String? selectedValue , int? questionId}) {
   
      mapOfQuestion[questionId]?.selectedAns = selectedValue;
      notifyListeners();
  }


   void nextQuestion(){
     currentQuestion = currentQuestion!+1;
     notifyListeners();
   }

   void resetQuestion(){
     currentQuestion = 0;
     notifyListeners();
   }
   void backQuestion(){
     currentQuestion =currentQuestion!-1;
      notifyListeners();
   }


    bool isPass(){
     
      double avg = numberOfQuestionInQuiz! / 2;
      return avg >= getCorrentAns() ? false : true;
   }

   int getCorrentAns(){
     int correctAns=0;
      mapOfQuestion.forEach((key, value) {
          if(value.isAnsCorrect()){
              correctAns++;
          }
       });
    return correctAns;
   }

 int totalAttemtAns(){
     int totalAttemtAns=0;
      mapOfQuestion.forEach((key, value) {
          if(value.selectedAns != null){
              totalAttemtAns++;
          }
       });
    return totalAttemtAns;
   }
   String getDescription(){
    
     String correctAns = getCorrentAns().toString();
     String totalAttemt = totalAttemtAns().toString();

       String sb = "You have Answered $correctAns of  $numberOfQuestionInQuiz correctly \n You have Attempt $totalAttemt of  $numberOfQuestionInQuiz "; 
       return sb;
   }

}
