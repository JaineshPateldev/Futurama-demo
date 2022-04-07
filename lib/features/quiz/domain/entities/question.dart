class Question {
  Question({
    required this.id,
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswer,
  });
   final int? id;
   final String? question;
   final List<String>? possibleAnswers;
   final String? correctAnswer;



   String? selectedAns;




  bool isAnsCorrect(){
    return selectedAns == correctAnswer;
  }

  
 
}