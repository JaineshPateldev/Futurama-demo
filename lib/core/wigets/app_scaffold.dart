
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../di_container.dart';
import '../core_export.dart';


class AppScaffold extends StatefulWidget {
  final Function onInit;
  Function? appBarOnTabFunction;
  Widget? header;
  String? headerTitle;
  Key? key;
  Widget body;
  Color? bodyColor;
  bool? isHome;
  

  AppScaffold({
    required this.onInit,
    this.appBarOnTabFunction,
    this.key,
    this.bodyColor,
     this.header,
     this.headerTitle,
    required this.body,
    this.isHome,
  });

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {

  @override
  void initState() {
  
    
    super.initState();
     widget.onInit();
  
  }

  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: widget.key,
      
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[widget.header ?? header() , body(context)],
      ),
    );
  }

  Widget header() {
    var height;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          gradient: alphaGradient,
        ),
        height: height,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              //title: Center(child: Text(sl<PackageInfo>().appName.toUpperCase() , style: appBarTitleStyle(),)),
              title: Center(child: Text(widget.headerTitle ?? "Application V1" , style: appBarTitleStyle(),)),
              leading: IconButton(
                icon: Icon(
                  widget.isHome == true ? Icons.menu : CupertinoIcons.back,
                  size: 24,
                  color: Colors.white,
                ),
                onPressed: () => widget.appBarOnTabFunction!(),
              ),
              actions: [
                widget.isHome == true
                    ? IconButton(
                        icon: const Icon(
                          CupertinoIcons.gear,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPressed: () {
                           SnackBar(backgroundColor: whiteColor ,content: Text('Under Development' , style: snackBarStyle())).show(context);
                        },
                      )
                    : const SizedBox.shrink()
              ],
            ),
           // widget.header,
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        height: SizeConfig.safeBlockVertical! * 94,
        width: double.infinity,
        margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 5),
        child: Container(
          child: widget.body,
        ),
      ),
    );
  }
}
