import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:futurama/core/ui/language/app_localizations.dart';
import 'package:futurama/features/home/presentation/widgets/creators_widget.dart';
import 'package:futurama/features/quiz/domain/entities/question.dart';
import 'package:futurama/features/quiz/presentation/controller/quiz_controller.dart';
import 'package:futurama/features/quiz/presentation/widgets/question_widget.dart';
import 'package:futurama/features/quiz/presentation/widgets/score_widget.dart';
import 'package:futurama/features/routing/route_path.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/src/provider.dart';

import '../../../../core/core_export.dart';
import '../../../../di_container.dart';


class QuizWidget extends StatelessWidget {
 final List<Question> questions;
  const QuizWidget({ Key? key ,required  this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       scrollDirection: Axis.vertical,
      child: GFCard(
                    elevation: 5.5,
                      boxFit: BoxFit.cover,
                      title: GFListTile(title: ScoreWidget(),),
                      content:QuestionWidget(question: questions[context.watch<QuizController>().currentQuestion!]),
                      buttonBar: GFButtonBar(
                      children: <Widget>[
                                SizedBox(
                                    width: SizeConfig.safeBlockHorizontal! * 40.0,
                                    child: CustomButton(
                                      buttonText:(AppLocalizations.of(context)?.translate('back'))!,
                                      buttonColor: aBlueLight,
                                      textColor: darkTextColor,
                                      onPressed: () {
                                       context.read<QuizController>().backQuestion();
                                       if(context.read<QuizController>().currentQuestion! == 0){
                                         context.read<QuizController>().nextQuestion();
                                         showExitDialog(context :context ,title:(AppLocalizations.of(context)?.translate('do_you_want_to_exit_the_quiz') )!+ " !!" ,desc: "");
                                       }
                                        //SnackBar(backgroundColor: whiteColor ,content: Text('Back' , style: snackBarStyle())).show(context);
                                      }
                                    ),
                                  ),
                                SizedBox(
                                    width: SizeConfig.safeBlockHorizontal! * 40.0,
                                    child: CustomButton(
                                      buttonText: (AppLocalizations.of(context)?.translate('next'))! ,
                                      buttonColor: aBlueLight,
                                      textColor: darkTextColor,
                                      onPressed: () {
                                         context.read<QuizController>().nextQuestion();
                                           if(context.read<QuizController>().currentQuestion! >=  questions.length){
                                              context.read<QuizController>().backQuestion();
                                              showFnishDialog(context :context ,title:(AppLocalizations.of(context)?.translate('do_you_want_to_finish_the_quiz') )!+ " !!",desc: "");
                                            }
                                    //    SnackBar(backgroundColor: whiteColor ,content: Text('Next' , style: snackBarStyle())).show(context);
                                      }
                                    ),
                                  ),
    
                      ],
                      ),
                      ),
    );
  }


    void showExitDialog({required BuildContext context , title , desc}) {
                   AwesomeDialog(
                            context: context,
                            dialogType: DialogType.QUESTION,
                            
                            headerAnimationLoop: true,
                            animType: AnimType.TOPSLIDE,
                            showCloseIcon: true,
                            closeIcon: Icon(Icons.close_fullscreen_outlined),
                            title: title,
                            desc:desc,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              context.read<QuizController>().resetQuestion();
                              sl<NavigationService>().goBack();
                            })
                          .show();
  }

   void showFnishDialog({required BuildContext context , title , desc}) {
                   AwesomeDialog(
                            context: context,
                            dialogType: DialogType.WARNING,
                            
                            headerAnimationLoop: true,
                            animType: AnimType.TOPSLIDE,
                            showCloseIcon: true,
                            closeIcon: Icon(Icons.close_fullscreen_outlined),
                            title: title,
                            desc:desc,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                                  context.read<QuizController>().resetQuestion();
                              //sl<NavigationService>().goBack();
                              showResultDialog(context: context);
                            })
                          .show();
  }

       void showResultDialog({required BuildContext context}) {
                   AwesomeDialog(
                            context: context,
                            dialogType: context.read<QuizController>().isPass() ?  DialogType.SUCCES : DialogType.ERROR,
                            headerAnimationLoop: true,
                            animType: AnimType.TOPSLIDE,
                            showCloseIcon: false,
                            closeIcon: Icon(Icons.close_fullscreen_outlined),
                            title: context.read<QuizController>().isPass() ?  (AppLocalizations.of(context)?.translate('congratulations_pass') )!+ " !!" :(AppLocalizations.of(context)?.translate('unfortunately_fail') )! ,
                            desc: context.read<QuizController>().getDescription(), 
                            btnOkOnPress: () {
                                  context.read<QuizController>().resetQuestion();
                                   sl<NavigationService>().goBack();
                            })
                          .show();
  }

}