import 'package:flutter/material.dart';
import 'package:little_paw/screen/dashboard.dart';
import 'package:little_paw/screen/Notifications.dart';
import 'package:little_paw/screen/Setting.dart';
import 'screen/Mypet.dart';
import 'screen/Clinic.dart';
import 'package:little_paw/app.dart';
import 'package:little_paw/bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Newfeed")
      child = Dashboard();
    else if (tabItem == "Clinic")
      child = Clinic();
    else if (tabItem == "MyPet")
      child = MyPet();
    else if (tabItem == "NotificationFeed")
      child = NotificationFeed();
    else if (tabItem == "Setting") child = Setting();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
