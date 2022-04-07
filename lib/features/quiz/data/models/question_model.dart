

import 'package:futurama/features/quiz/domain/entities/question.dart';

class QuestionModel extends Question{

  
   QuestionModel({
      int? id,
      String? question,
      List<String>? possibleAnswers,
      String? correctAnswer,
  }) : super(id: id, correctAnswer: correctAnswer , possibleAnswers: possibleAnswers , question: question);


   factory QuestionModel.fromJson(Map<String, dynamic> json){
 
     late List<String> possibleAnswersl  = List.castFrom<dynamic, String>(json['possibleAnswers']).cast<String>();
    return QuestionModel(id:json['id'] , question : json['question'], possibleAnswers :possibleAnswersl , correctAnswer : json['correctAnswer'].toString());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question'] = question;
    _data['possibleAnswers'] = possibleAnswers;
    _data['correctAnswer'] = correctAnswer;
    return _data;
  }

}