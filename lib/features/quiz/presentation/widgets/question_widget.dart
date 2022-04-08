import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/features/quiz/domain/entities/question.dart';

import 'option_widget.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
    QuestionWidget({Key? key, required this.question});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        
      },
      child: Column(
            children: <Widget>[
              
              Padding(
                padding:  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal!* 0.1),
                child: Align(
                  alignment: Alignment.topLeft,
                  child:   Hero(
                            tag: "name-${question.id.toString()}",
                            child: Material(
                              color: Colors.transparent,
                             
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(question.question.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 15,
                                        style: questionrHeadingTextStyle,
                                    ),
                                
                                 ),
                            ),
                          ),
                ),
              ),
            
               Padding(
                 padding:  EdgeInsets.only(top: SizeConfig.screenWidth! *0.01),
                 child: OptionWidget(option: question.possibleAnswers!  , questionId : question.id),
               ),          
            ],
          )
    );
    
}
}
