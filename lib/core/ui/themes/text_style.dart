
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui_export.dart';

TextStyle snackBarStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}

TextStyle appBarTitleStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}

TextStyle chipLableStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}




// Common Used
TextStyle headerStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 5,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
TextStyle titleStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}

TextStyle descriptionTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}

TextStyle lableTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );
}

TextStyle normalTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
  );
}
TextStyle commonUseBellowHeaderTextDeffrentColorStyle({required Color color}) {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 5,

    color: color,
    fontWeight: FontWeight.w600,
  );
}



TextStyle textInputTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
  );
}

TextStyle errorTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: redColors,
    fontWeight: FontWeight.w500,
  );
}

//CheckBox Style
TextStyle checkBoxStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}

// SubText Text
TextStyle subTitleTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    color: Colors.black,
  );
}


//CUSTOM BUTTON
TextStyle customButtonStyle({required Color textColor}) {
  return GoogleFonts.montserrat(
    color: textColor,
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
  );
}

// custom input text
TextStyle customInputTextHint() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black45,
  );
}
//For custom Text input
TextStyle customInputTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: SizeConfig.safeBlockHorizontal! * 4,
    color: Colors.black,
  );
}
