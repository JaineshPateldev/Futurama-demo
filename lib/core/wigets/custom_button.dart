import 'package:flutter/material.dart';

import '../core_export.dart';



class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double? marginAll;
  double? elevation;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Color? iconColor;
  bool? isPrefixIcon;
  bool? isSuffixIcon;

  CustomButton({
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    this.elevation,
    this.marginAll = 0.0,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.isPrefixIcon = false,
    this.isSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
      elevation: elevation,
      onPressed: () => onPressed(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: buttonColor,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: marginAll!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isPrefixIcon == false
                ? SizedBox.shrink()
                : Container(
                    margin: EdgeInsets.only(
                        right: SizeConfig.safeBlockHorizontal! * 2.0),
                    child: Icon(
                      prefixIcon,
                      color: iconColor,
                      size: SizeConfig.safeBlockHorizontal! * 5.0,
                    ),
                  ),
            Text(
              buttonText,
              semanticsLabel: buttonText,
              style: customButtonStyle(
                textColor: textColor,
                
              ),
            ),
            isSuffixIcon == false
                ? SizedBox.shrink()
                : Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal! * 2.0),
                    child: Icon(
                      suffixIcon,
                      color: iconColor,
                      size: SizeConfig.safeBlockHorizontal! * 5.0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
