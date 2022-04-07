import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/core/ui/ui_export.dart';
import 'package:futurama/features/character/domain/entities/character.dart';
import 'package:futurama/features/routing/route_path.dart';

import '../../../../di_container.dart';

class CharacterWidgets extends StatelessWidget {
  final Character character;
  final PageController? pc;
  final int cp;

    CharacterWidgets({Key? key, required this.character,required this.pc,required this.cp});

  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_) {
        //   return CharacterDetails(char: character);
        // }));
        sl<NavigationService>().navigateTo(RoutePaths.charactersDetails , arguments: character);
      },
      child: AnimatedBuilder(
        animation: pc!,
        builder: (context, child) {
          double value = 1;
          if (pc!.position.haveDimensions) {
            value = pc!.page! - cp;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          }
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ClipPath(
                    clipper: CharacterCardBackgroundClipper(),
                    child: Hero(
                      tag: "background-${character.name}",
                      child: Container(
                        height: SizeConfig.screenWidth! * 1,
                        width: SizeConfig.screenWidth!  * 0.9,
                        decoration: BoxDecoration(
                            gradient:characterGradient
                               ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Hero(
                  tag: "image-${character.name.toString()}",
                  child:Image.network(
                            character.images.main,
                            width: SizeConfig.screenHeight! * 0.55 * value,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Align(child: Center(child: CircularProgressIndicator()));
                            },
                          ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 52, right: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Hero(
                      tag: "name-${character.name.toString()}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            character.name.toString(),
                            style: heading,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "tap to read more",
                      style: subHeading,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
