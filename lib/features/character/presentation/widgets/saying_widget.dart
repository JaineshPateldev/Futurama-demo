
import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';

class SayingsWidget extends StatelessWidget {
 List<String>  saying;

   SayingsWidget({ Key? key , required this.saying }) : super(key: key);

  double spacing = 5.1;
  @override
  Widget build(BuildContext context) {
    return     SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding:EdgeInsets.fromLTRB(32, 1, 8, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children :getWidgets(context,saying),
          ),
      ),
    );
  }


  List<Widget> getWidgets(context,List<String> saying){
    List<Widget> list  = [];

    saying.forEach((element) {

            Widget widget = Card( 
                                
                                elevation: 5,
                                child :Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(element ,
                                              overflow: TextOverflow.ellipsis, maxLines: 5 , style:chatStyle),
                                            ),
                                 ));
            list.add(widget);
    });


    return list;



  }
}
