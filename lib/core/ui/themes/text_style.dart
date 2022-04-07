
import 'package:flutter/material.dart';

import '../ui_export.dart';




   const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

   const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

   final TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontSize: 34,
    color: Colors.white.withOpacity(0.8),
    letterSpacing: 1.2,
  );

   final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: Colors.white.withOpacity(0.8),
  );


  final TextStyle chatStyle = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Colors.grey.withOpacity(0.8),
  );

TextStyle snackBarStyle() {
 
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
    fontWeight: FontWeight.w600,
);
}

TextStyle appBarTitleStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}

TextStyle chipLableStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}




// Common Used
TextStyle headerStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 5,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
TextStyle titleStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}

TextStyle descriptionTextStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}

TextStyle lableTextStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );
}

TextStyle normalTextStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
  );
}
TextStyle commonUseBellowHeaderTextDeffrentColorStyle({required Color color}) {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 5,

    color: color,
    fontWeight: FontWeight.w600,
  );
}



TextStyle textInputTextStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
  );
}

TextStyle errorTextStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: redColors,
    fontWeight: FontWeight.w500,
  );
}

//CheckBox Style
TextStyle checkBoxStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}

// SubText Text
TextStyle subTitleTextStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.black,
  );
}


//CUSTOM BUTTON
TextStyle customButtonStyle({required Color textColor}) {
  return TextStyle(
    color: textColor,
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
  );
}

// custom input text
TextStyle customInputTextHint() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black45,
  );
}
//For custom Text input
TextStyle customInputTextStyle() {
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
  );
}
