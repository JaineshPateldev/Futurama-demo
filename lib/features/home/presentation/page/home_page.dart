import 'package:flutter/material.dart';
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
      case UiState.error :
          return  CustomErrorWidget(title: homeController!.errorMessage , refreshFunction: ()=>homeController.gtInfo());
      case UiState.loaded :
          return InfoWidget(info: homeController.info);
      default:
         // return  CustomErrorWidget(title:"Retry",refreshFunction: ()=>homeController.gtInfo());
          return const Align(child: Center(child: CircularProgressIndicator()));
    }
  
  }
}
