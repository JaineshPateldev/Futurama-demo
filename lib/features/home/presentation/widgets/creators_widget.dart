import 'dart:ffi';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/features/home/domain/entities/info.dart';
import 'package:url_launcher/url_launcher.dart';

class CreatorsWidget extends StatelessWidget {
 List<Creators>  creators;

   CreatorsWidget({ Key? key , required this.creators }) : super(key: key);

  double spacing = 5.1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          
      ExcludeSemantics(
        child: Padding(
              padding: const EdgeInsets.only(top: 5),
          child:Align(alignment: Alignment.topLeft,
                  child: Text("Creators :" , style: lableTextStyle() , textAlign: TextAlign.left,)),  
        ),
      ),
        Align(
            alignment: Alignment.center,
            child: Wrap(
              runSpacing: spacing,
              spacing: spacing,
                children: getWidgets(context,creators),
              
                ),
          ),
      ],
    );
  }


  List<Widget> getWidgets(context,List<Creators> creators){
    List<Widget> list  = [];

    creators.forEach((element) {

            Widget actionChip =   ActionChip(    
                  backgroundColor: chipColor,
                  
                  label: Wrap(
                    children : [ 
                       const Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(Icons.link),
                        ), 
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(element.name , style: chipLableStyle(),semanticsLabel: "Creators " +element.name),
                        )
                      ]),
                  
                //  labelStyle: chipLableStyle(),
                  onPressed: () async {
                     SnackBar(backgroundColor: whiteColor ,content: Text('Opening ' + element.name , style: snackBarStyle())).show(context);
                      if (await canLaunch(element.url)) {
                              // Launch the App
                              await launch(
                                element.url,
                              );
                              // and cancel the request
                            
                      }
                  }
                );
            list.add(actionChip);
    });


    return list;



  }

  


}


