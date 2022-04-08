import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/features/quiz/presentation/controller/quiz_controller.dart';
import 'package:provider/src/provider.dart';

class ScoreWidget extends StatelessWidget {
    ScoreWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
      },
      child: Padding(
                padding:  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal!* 0.1),
                child: Stack(
                  children:[ 

                    Align(
                    alignment: Alignment.topLeft,
                    child:Hero(
                              tag: "current-q",
                              child: Material(
                                color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Q : "+ (context.read<QuizController>().currentQuestion!+1).toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: questionrHeadingTextStyle,
                                      ),
                                   ),
                              ),
                            ),
                  ),
                  ]
                ),
              )
    );
}
}
