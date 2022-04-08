
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:futurama/core/ui/themes/theme_controller.dart';
import 'package:provider/src/provider.dart';
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
        children: <Widget>[widget.header ?? header(context) , body(context)],
      ),
    );
  }

  Widget header(BuildContext context) {
    var height;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        height: height,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              //title: Center(child: Text(sl<PackageInfo>().appName.toUpperCase() , style: appBarTitleStyle(),)),
              title: Align(alignment: Alignment.centerLeft,child: Text(widget.headerTitle ?? "Futurama Application" , style: appBarTitleStyle(context),)),
              actions: [
                widget.isHome == true
                    ?  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 5,
                        width: 120,
                        child: AnimatedToggleSwitch<bool>.dual(
                                  current: context.read<ThemeController>().currentTheme,
                                  first: false,
                                  second: true,
                                  dif: 50.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 5.0,
                                  height: 55,
                                  animationOffset: const Offset(20.0, 0),
                                  clipAnimation: true,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 1.5),
                                    ),
                                  ],
                                  onChanged: (b) =>  context.read<ThemeController>().toggleTheme(),
                                  colorBuilder: (b) => b ? Colors.red : Colors.green,
                                  iconBuilder: (value) => value
                                      ? const Icon(Icons.dark_mode)
                                      :const Icon(Icons.light_mode),
                                  textBuilder: (value) => value
                                      ?  Center(child: Text('Dark Mode',style: toggleTitleStyle(context) ,  semanticsLabel:"Light Mode"))
                                      :  Center(child: Text('Light Mode' , style: toggleTitleStyle(context),  semanticsLabel:"Dark Mode")),
                                ),
                      ),
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
        decoration:  BoxDecoration(
         color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        height: SizeConfig.safeBlockVertical! *90,
        width: double.infinity,
        margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 5),
        child: Container(
          child: widget.body,
        ),
      ),
    );
  }
}
