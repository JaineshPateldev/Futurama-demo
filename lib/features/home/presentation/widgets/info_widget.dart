import 'package:flutter/material.dart';
import 'package:futurama/core/ui/language/app_localizations.dart';
import 'package:futurama/features/home/presentation/widgets/creators_widget.dart';
import 'package:futurama/features/routing/route_path.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../core/core_export.dart';
import '../../domain/entities/info.dart';


class InfoWidget extends StatelessWidget {
 final Info info;
  const InfoWidget({ Key? key ,required  this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(AppLocalizations.of(context)?.translate('information_of'));
    return SingleChildScrollView(
       scrollDirection: Axis.vertical,
       
      child: Semantics(
        value:AppLocalizations.of(context)?.translate('information_of'),
        child: GFCard(
                      elevation: 5.5,
                        boxFit: BoxFit.cover,
                        content:Column(
                              children: [
                                MergeSemantics(
                                  child: Column(
                                    children: [
                                        Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                                    child: Align(alignment: Alignment.topLeft,
                                      child: Text((AppLocalizations.of(context)?.translate('synopsis'))! + " : " , style: lableTextStyle() , textAlign: TextAlign.left)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: Text(info.synopsis , style: descriptionTextStyle()),
                                  ),

                                    ],
                                  ),
                                ),
                               
                              
                                Padding(
                                     padding: const EdgeInsets.only(top: 5),
                                  child: MergeSemantics(
                                    child: Row(
                                      children: [
                                         Text((AppLocalizations.of(context)?.translate('years_aired'))! + " : " , style: lableTextStyle() , textAlign: TextAlign.left, semanticsLabel: AppLocalizations.of(context)?.translate('years_form')),
                                         Padding(
                                            padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                                            child :Text(info.yearsAired , style: descriptionTextStyle()),
                                         ),
                                      ],
                                    ),
                                  ),
                                ),

                              
                                
                              CreatorsWidget(creators: info.creators),
                              ],
                            ),
                          
                        
                        buttonBar: GFButtonBar(
                        children: <Widget>[
                        
    
                                  SizedBox(
                                      width: SizeConfig.safeBlockHorizontal! * 40.0,
                                      child: CustomButton(
                                        buttonText: (AppLocalizations.of(context)?.translate('view_characters') )!,
                                        buttonColor: aBlueLight,
                                        textColor: darkTextColor,
                                        onPressed: () {
                                          sl<NavigationService>().navigateTo(RoutePaths.charactersPage);
                                         // SnackBar(backgroundColor: whiteColor ,content: Text('View Characters' , style: snackBarStyle())).show(context);
                                        }
                                      ),
                                    ),
                                  SizedBox(
                                      width: SizeConfig.safeBlockHorizontal! * 40.0,
                                      child: CustomButton(
                                        buttonText: (AppLocalizations.of(context)?.translate('take_a_quiz'))!,
                                        buttonColor: aBlueLight,
                                        textColor: darkTextColor,
                                        onPressed: () =>  sl<NavigationService>().navigateTo(RoutePaths.quizPage)
                                      ),
                                    ),
    
                        ],
                        ),
                        ),
      ),
    );
  }
}