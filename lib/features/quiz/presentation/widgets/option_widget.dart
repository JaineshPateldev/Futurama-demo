import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/features/quiz/presentation/controller/quiz_controller.dart';
import 'package:provider/provider.dart';

class OptionWidget extends StatelessWidget {
 List<String>  option;
 int? questionId;

   OptionWidget({ Key? key , required this.option, required this.questionId }) : super(key: key);

  double spacing = 5.1;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Wrap(
          runSpacing: spacing,
          spacing: spacing,
            children: getWidgets(context,option),
          
            ),
      );
  }
  List<Widget> getWidgets(BuildContext context,List<String> option){
    List<Widget> list  = [];

  
    option.forEach((element) {

            Widget options =  RadioListTile(
                      title: Text(element, style: optionTextStyle),
                      groupValue: context.watch<QuizController>().getSelectedAns(questionId : questionId),
                      value: element,
                      onChanged: (val) {
                         context.read<QuizController>().selectedOption(questionId: questionId , selectedValue: val.toString());
                      },
                    );
           

            list.add(options);
    });


    return list;



  }

  


}


