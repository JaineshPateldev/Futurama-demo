import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/core/ui/language/app_localizations.dart';
import '../widgets/saying_widget.dart';

class CharacterDetailPage extends StatefulWidget {
  final char;

  const CharacterDetailPage({Key? key, required this.char}) : super(key: key);

  @override
  _CharacterDetailPageState createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
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
                          style: characterHeading,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 5, 8, 32),
                  child: Text(
                     (AppLocalizations.of(context)?.translate('gender') )!+" : "+ widget.char.gender,
                    style: characterSubHeading,
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                       (AppLocalizations.of(context)?.translate('species') )!+" : "+ widget.char.species,
                    style: characterSubHeading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                      (AppLocalizations.of(context)?.translate('home_planet'))!+" : "+ widget.char.homePlanet,
                    style: characterSubHeading,
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                     (AppLocalizations.of(context)?.translate('occupation'))!+" : "+ widget.char.occupation,
                    style: characterSubHeading,
                  ),                  
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 0),
                  child: Text(
                     (AppLocalizations.of(context)?.translate('saying'))!+" : ",
                    style: characterSubHeading
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
