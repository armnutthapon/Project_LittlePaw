import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom/tab_navigator.dart';
import 'package:flutter/cupertino.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  String _currentPage = "MyPet";
  List<String> pageKeys = ["Page1", "Clinic", "MyPet", "Page4", "Page5"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Clinic": GlobalKey<NavigatorState>(),
    "MyPet": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
    "Page5": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 2;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "MyPet") {
            _selectTab("MyPet", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Page1"),
          _buildOffstageNavigator("Clinic"),
          _buildOffstageNavigator("MyPet"),
          _buildOffstageNavigator("Page4"),
          _buildOffstageNavigator("Page5"),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.redAccent,
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.solidNewspaper),
              title: new Text(
                '',
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.stethoscope),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.paw),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.solidBell),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.cog),
              title: new Text(''),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
