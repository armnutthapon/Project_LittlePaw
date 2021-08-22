import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/database/database.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:little_paw/tab_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  void insertData() async {
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User userId = await auth.currentUser;
    final String uid = await userId.uid;
    final String email = await userId.email;
    http.Response response =
        await http.post(Uri.parse('$Url/owner/insert/$uid/$email'));
    print("UserID : " + uid);
  }

  @override
  void initState() {
    super.initState();
    insertData();
  }

  String _currentPage = "MyPet";
  List<String> pageKeys = [
    "Newfeed",
    "Clinic",
    "MyPet",
    "NotificationFeed",
    "Setting"
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Newfeed": GlobalKey<NavigatorState>(),
    "Clinic": GlobalKey<NavigatorState>(),
    "MyPet": GlobalKey<NavigatorState>(),
    "NotificationFeed": GlobalKey<NavigatorState>(),
    "Setting": GlobalKey<NavigatorState>(),
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
    Size size = MediaQuery.of(context).size;

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
        extendBody: true,
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Newfeed"),
          _buildOffstageNavigator("Clinic"),
          _buildOffstageNavigator("MyPet"),
          _buildOffstageNavigator("NotificationFeed"),
          _buildOffstageNavigator("Setting"),
        ]),
        bottomNavigationBar: SizedBox(
          height: size.height * 0.08,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.red.shade300,
              selectedItemColor: Colors.white,
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
                  icon: new Icon(
                    FontAwesomeIcons.paw,
                    size: 30,
                  ),
                  title: new Text(''),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(FontAwesomeIcons.solidBell),
                  title: new Text(''),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(FontAwesomeIcons.userAlt),
                  title: new Text(''),
                ),
              ],
              type: BottomNavigationBarType.fixed,
            ),
          ),
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
