import 'package:flutter/material.dart';
import './screen/mypet.dart';
import './screen/clinic.dart';
import 'package:persistent_bottom/app.dart';
import 'package:persistent_bottom/bottom_navigation.dart';

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
    if (tabItem == "Page1")
      child = Page1();
    else if (tabItem == "Clinic")
      child = Clinic();
    else if (tabItem == "MyPet")
      child = MyPet();
    else if (tabItem == "Page4")
      child = Page4();
    else if (tabItem == "Page5") child = Page5();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text("data"),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      color: Colors.red,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Page4()));
            },
            child: Card(
                child: Column(
              children: <Widget>[
                ClipRRect(
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.red.shade400,
                    size: 40,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "ข้อมูลสัตว์เลี้ยง",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Mitr'),
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Text("data"),
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({Key key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 90),
        ])),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            centerTitle: true,
            title: Text("ปีโป้",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mitr')),

            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),

            backgroundColor:
                Colors.red.withOpacity(0.0), //You can make this transparent
            elevation: 0.0, //No shadow
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Page6()));
          },
          child: Card(
              child: Column(
            children: <Widget>[
              ClipRRect(
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.red.shade400,
                  size: 40,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "ข้อมูลสัตว์เลี้ยง",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Mitr'),
                ),
              )
            ],
          )),
        ),
      ]),
    );
  }
}

class Page5 extends StatefulWidget {
  const Page5({Key key}) : super(key: key);

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Page6 extends StatefulWidget {
  const Page6({Key key}) : super(key: key);

  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 90),
        ])),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            centerTitle: true,
            title: Text("PAGE 3",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mitr')),

            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),

            backgroundColor:
                Colors.blue.withOpacity(0.0), //You can make this transparent
            elevation: 0.0, //No shadow
          ),
        ),
      ]),
    );
  }
}
