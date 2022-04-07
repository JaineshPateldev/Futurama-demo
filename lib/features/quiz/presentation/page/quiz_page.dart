import 'package:flutter/material.dart';
import 'package:futurama/features/quiz/presentation/widgets/question_widget.dart';
import 'package:futurama/features/quiz/presentation/widgets/quiz_widget.dart';
import '../controller/quiz_controller.dart';
import 'package:provider/provider.dart';
import '../../../../core/core_export.dart';
class QuizPage extends StatefulWidget {
  
  const QuizPage({Key? key }) : super(key: key);


  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> { 

 PageController? _pageController;
 int currentPage = 0;

  dynamic model;
  @override
  void initState() {
    super.initState();
    
     _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
   
  }

  @override
  Widget build(BuildContext context) {

     SizeConfig().init(context);
      model = Provider.of<QuizController>(context,listen: true);
    return AppScaffold(
      onInit: (){
         model.getQuestions();
       
        
      },
      isHome: true,
      body: _buidBody(context,this.model),

      appBarOnTabFunction: ()=>   SnackBar(backgroundColor: whiteColor ,content: Text('Under Development' , style: snackBarStyle())).show(context)
      
    );
  }

  Widget _buidBody(BuildContext context , controller) {

    switch(controller!.currentState){

      case UiState.loading :
          return const Align(child: Center(child: CircularProgressIndicator()));
      case UiState.none :
          return const Align(child: Center(child: CircularProgressIndicator()));
      case UiState.error :
          return  CustomErrorWidget(title: controller!.errorMessage , refreshFunction: ()=>controller.getQuestions());
      case UiState.loaded :
          return QuizWidget(questions: controller.questions);
      default:
            return  CustomErrorWidget(title: '' , refreshFunction: ()=>controller.getQuestions());
    }
  
  }

  // PageView.builder(
  //                 itemCount: controller.questions.length,
  //                 controller: _pageController,
  //                 itemBuilder: (context, index) {
  //                   return QuestionsWidgets(
  //                       question: controller.questions[index],
  //                       pc: _pageController,
  //                       cp: index);
  //                 },
  //           );
}
