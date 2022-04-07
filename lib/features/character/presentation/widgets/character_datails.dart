import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/features/character/domain/entities/character.dart';

import '../../../../di_container.dart';
import 'saying_widget.dart';

class CharacterDetails extends StatefulWidget {
  final char;

  const CharacterDetails({Key? key, required this.char}) : super(key: key);

  @override
  _CharacterDetailsState createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "background-${widget.char.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient:characterGradient),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(top: 35, left: 8),
                  child: IconButton(
                    icon: Hero(
                      tag:"close",
                      child: Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    onPressed: () {
                      sl<NavigationService>().goBack();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                  tag: "image-${widget.char.name.toString()}",
                  child:Center(
                    child: Image.network(
                              widget.char.images.main,
                              width: SizeConfig.screenWidth! *   0.45,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Align(child: Center(child: CircularProgressIndicator()));
                              },
                            ),
                  ),
                ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Hero(
                    tag: "name-${widget.char.name}",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          widget.char.name.toString(),
                          style: heading,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 5, 8, 32),
                  child: Text(
                     "Gender : "+ widget.char.gender,
                    style: subHeading,
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                     "Species : "+ widget.char.species,
                    style: subHeading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                     "Home Planet : "+ widget.char.homePlanet,
                    style: subHeading,
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                     "Occupation : "+ widget.char.occupation,
                    style: subHeading,
                  ),                  
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 0),
                  child: Text(
                     "Saying : ",
                    style: subHeading,
                  ),                  
                ),
            
                  Padding(
                     padding: const EdgeInsets.fromLTRB(32, 1, 8, 0),
                     child: Center(
                      
                         child: SizedBox(
                           height: SizeConfig.safeBlockVertical! * 25,
                           child: SayingsWidget(saying: widget.char.sayings)),
                       ),
                     ),
                 
                 
                 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
