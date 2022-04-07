import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:futurama/features/home/presentation/widgets/creators_widget.dart';
import 'package:futurama/features/routing/route_path.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../core/core_export.dart';
import '../../../../di_container.dart';
import '../../domain/entities/character.dart';


class CharacterWidgetOld extends StatelessWidget {
 final Character character;
 
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

   CharacterWidgetOld({ Key? key ,required  this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       scrollDirection: Axis.vertical,
      child: GFCard(
                    elevation: 5.5,
                      boxFit: BoxFit.cover,
                      title: GFListTile(
                        avatar: Image.network(
                        character.images.main,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Align(child: Center(child: CircularProgressIndicator()));
                        },
                        width: SizeConfig.safeBlockHorizontal! * 15,
                      ),
                        title:Padding(
                                   padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Text("Name : " , style: lableTextStyle() , textAlign: TextAlign.left,),
                                     Flexible(
                                       child: Text(character.name.toString() ,
                                       overflow: TextOverflow.ellipsis, maxLines: 5 , style: descriptionTextStyle()),
                                     ),
                                  ],
                                ),
                              ),
                        subTitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                                      width: SizeConfig.safeBlockHorizontal! * 40.0,
                                      child: CustomButton(
                                        buttonText: "Details",
                                        buttonColor: aBlueLight,
                                        textColor: darkTextColor,
                                        onPressed: () {
                                        displayCharacterDetail(context);
                                          //SnackBar(backgroundColor: whiteColor ,content: Text('View Characters' , style: snackBarStyle())).show(context);
                                        }
                                      ),
                                    ),
                        ),
                      ),
                     
                      ),
    );
  }

   void displayCharacterDetail(context) {
      showModalBottomSheet(context:context, builder: (context){
          return Card(
          elevation: 50,
          
          shadowColor:whiteColor,
          color:whiteColor, 
          child: SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 30,
            height: SizeConfig.safeBlockVertical! * 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Center(
                      child: SizedBox(                         
                        child: GFListTile(
                            avatar: Image.network(
                            character.images.main,
                            width: SizeConfig.safeBlockHorizontal! * 30,
                          ),
                                         ),
                      ),
                    ),

                      Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                     Text("Name : " , style: lableTextStyle() , textAlign: TextAlign.left,),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                                        child :Text(character.name.toString() , style: descriptionTextStyle()),
                                     ),
                                  ],
                                ),
                      ),

                       Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                     Text("Gender : " , style: lableTextStyle() , textAlign: TextAlign.left,),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                                        child :Text(character.gender, style: descriptionTextStyle()),
                                     ),
                                  ],
                                ),
                      ),

                       Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                     Text("Species : " , style: lableTextStyle() , textAlign: TextAlign.left,),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                                        child :Text(character.species , style: descriptionTextStyle()),
                                     ),
                                  ],
                                ),
                      ),

                       Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                     Text("Home Planet : " , style: lableTextStyle() , textAlign: TextAlign.left,),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                                        child :Text(character.homePlanet , style: descriptionTextStyle()),
                                     ),
                                  ],
                                ),
                      ),

                        Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                     Text("Occupation : " , style: lableTextStyle() , textAlign: TextAlign.left,),
                                    Flexible(
                                       child: Text(character.occupation ,
                                       overflow: TextOverflow.ellipsis, maxLines: 5 , style: descriptionTextStyle()),
                                     ),
                                  ],
                                ),
                      ),


                          Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                        Text("Saying : " , style: lableTextStyle() , textAlign: TextAlign.left,),
                                    
                                    ],
                                  ),
                          ),


                    
                         
                          SizedBox(
                                          height:  SizeConfig.safeBlockVertical! * 10,
                                              child: ListView.builder(
                                                  itemCount: character.sayings.length,
                                                  itemBuilder: (BuildContext context,int index){
                                                        return Card(
                                                          elevation: 5,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Flexible(
                                                                    child: Text(character.sayings[index] ,
                                                                    overflow: TextOverflow.ellipsis, maxLines: 5 , style: descriptionTextStyle()),
                                                                  ),
                                                          ),
                                                        );
                                                  }
                                              ),
                                      ),

                              
                ],
              ), //Column
            ), //Padding
          ), //SizedBox
        );
        });
  }
}