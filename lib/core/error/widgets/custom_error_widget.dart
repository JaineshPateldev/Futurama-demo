import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core_export.dart';

class CustomErrorWidget extends StatelessWidget {
  
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final Function? refreshFunction;

  const CustomErrorWidget({ Key? key ,this.title = "Error" ,this.titleStyle , this.subTitle, required this.refreshFunction}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Align(

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/warning.png',
              height: SizeConfig.safeBlockVertical! * 30.0,
              width: SizeConfig.safeBlockHorizontal! * 30.0,
            ),
            Text(
              title!,
               style: titleStyle ?? errorTextStyle()
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 2,
            ),
             Text(
              subTitle ??'',
              style: errorTextStyle(),
            ),


            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 5,
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 45.0,
              child: CustomButton(
                buttonText: "Retry",
                buttonColor: aBlueLight,
                textColor: darkTextColor,
                onPressed: () => refreshFunction!(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}