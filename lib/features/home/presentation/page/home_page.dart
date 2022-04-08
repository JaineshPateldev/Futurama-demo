import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:futurama/core/ui/language/app_language_controller.dart';
import 'package:futurama/features/home/presentation/widgets/info_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import '../../../../core/core_export.dart';
import '../../../../di_container.dart';
import '../controller/home_controller.dart';
class HomePage extends StatefulWidget {
  
  const HomePage({Key? key }) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 


  dynamic model;
  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {

     SizeConfig().init(context);
      model = Provider.of<HomeController>(context);
    return AppScaffold(
      onInit: (){
         model.getInfo();
       
        
      },
      isHome: true,
      body: _buidBody(context,this.model),

      appBarOnTabFunction: ()=>   SnackBar(backgroundColor: whiteColor ,content: Text('Under Development' , style: snackBarStyle())).show(context)
      
    );
  }

  Widget _buidBody(BuildContext context , homeController) {

    switch(homeController!.currentState){

      case UiState.loading :
          return const Align(child: Center(child: CircularProgressIndicator()));
      case UiState.none :
          return const Align(child: Center(child: CircularProgressIndicator()));
      case UiState.error :
          return  CustomErrorWidget(title: homeController!.errorMessage , refreshFunction: ()=>homeController.getInfo());
      case UiState.loaded :
          return  SingleChildScrollView(
       scrollDirection: Axis.vertical,
            child: Column(
              children: [
                
                InfoWidget(info: homeController.info),

                  ExcludeSemantics(
                    child: Padding(
                          padding: const EdgeInsets.all(20),
                      child:Align(alignment: Alignment.topLeft,
                              child: Text("To Access the Accessibility\nPlease Activated the Talkback" , style: headerStyle() , textAlign: TextAlign.left,)),  
                    ),
                  ),

                 Padding(
                          padding:  EdgeInsets.all(20),
                      child: AnimatedToggleSwitch<bool>.dual(
                                    current: context.read<AppLanguageController>().toggleLang,
                                    first: false,
                                    second: true,
                                    dif: 50.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 5.0,
                                    height: 55,
                                    animationOffset: Offset(20.0, 0),
                                    clipAnimation: true,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 1.5),
                                      ),
                                    ],
                                    onChanged: (b) {
                                      context.read<AppLanguageController>().toggleLanguage();
                                  //    Phoenix.rebirth(context);
                                    },
                                    colorBuilder: (b) => b ? Colors.transparent : Colors.transparent,
                                    iconBuilder: (value) => value
                                        ?  Image.asset('icons/flags/png/gb-eng.png', package: 'country_icons')
                                        : Image.asset('icons/flags/png/es.png', package: 'country_icons'),
                                    textBuilder: (value) => value
                                        ?  Center(child: Text("English", style: toggleTitleStyle(context), semanticsLabel:"Spanish"))
                                        :  Center(child: Text("Spanish", style: toggleTitleStyle(context),  semanticsLabel:"English")),
                                  ),  
                    ),
              ],
            ),
          );
      default:
            return  CustomErrorWidget(title: '' , refreshFunction: ()=>homeController.getInfo());
    }
  
  }
}
