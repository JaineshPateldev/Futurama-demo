import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:futurama/features/quiz/domain/entities/question.dart';

class QuestionsListWidgets extends StatelessWidget {
  final Question question;
  final PageController? pc;
  final int cp;

    QuestionsListWidgets({Key? key, required this.question,required this.pc,required this.cp});

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
        //sl<NavigationService>().navigateTo(RoutePaths.charactersDetailsPage , arguments: character);
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
                      tag: "background-${question.question}",
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
              // Align(
              //   alignment: Alignment(0, -0.5),
              //   child: Hero(
              //     tag: "image-${character.name.toString()}",
              //     child:Image.network(
              //               character.images.main,
              //               width: SizeConfig.screenHeight! * 0.55 * value,
              //               loadingBuilder: (context, child, loadingProgress) {
              //                 if (loadingProgress == null) return child;
              //                 return const Align(child: Center(child: CircularProgressIndicator()));
              //               },
              //             ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 52, right: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Hero(
                      tag: "name-${question.id.toString()}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            question.id.toString(),
                            style: characterHeading,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "tap to read more",
                      style: characterSubHeading,
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
