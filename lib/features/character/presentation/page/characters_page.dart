import 'package:flutter/material.dart';
import 'package:futurama/core/ui/language/app_localizations.dart';
import 'package:futurama/features/character/presentation/widgets/character_widgets.dart';
import 'package:provider/provider.dart';
import '../../../../core/core_export.dart';
import '../../../../di_container.dart';
import '../controller/character_controller.dart';

class CharactersPage extends StatefulWidget {
  
  const CharactersPage({Key? key }) : super(key: key);


  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> { 

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
      model = Provider.of<CharacterController>(context);
    return AppScaffold(
      onInit: (){
         model.getCharacters();
      },
      isHome: false,
      headerTitle: (AppLocalizations.of(context)?.translate('characters') )!,
      body: _buidBody(context,this.model),

      appBarOnTabFunction: ()=> sl<NavigationService>().goBack(),
      
    );
  }

  Widget _buidBody(BuildContext context , controller) {

    switch(controller!.currentState){

      case UiState.loading :
          return const Align(child: Center(child: CircularProgressIndicator()));
      case UiState.none :
          return const Align(child: Center(child: CircularProgressIndicator()));
      case UiState.error :
          return  CustomErrorWidget(title: controller!.errorMessage , refreshFunction: ()=>controller.getCharacters());
      case UiState.loaded :
          return PageView.builder(
                  itemCount: controller.characters.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return CharacterWidgets(
                        character: controller.characters[index],
                        pc: _pageController,
                        cp: index);
                  },
                );
      default:
          return const Align(child: Center(child: CircularProgressIndicator()));
    }
  }
}