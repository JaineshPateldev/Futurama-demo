import 'package:flutter/widgets.dart';


class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, ((Route<dynamic> route) => false),
        arguments: arguments);
  }

  Future<dynamic> popAndNavigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
