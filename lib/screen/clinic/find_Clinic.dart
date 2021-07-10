import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'filter.dart';
import '../../component/ClinicCard.dart';

class Page_FindClinic extends StatefulWidget {
  const Page_FindClinic({Key key}) : super(key: key);

  @override
  _Page_FindClinicState createState() => _Page_FindClinicState();
}

class _Page_FindClinicState extends State<Page_FindClinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(),
        findClinicMain(),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 70.0),
        ])),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              "ค้นหาคลินิก",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ), // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white.withOpacity(1.0),
            elevation: 10,
          ),
        ),
      ]),
    );
  }
}

class findClinicMain extends StatefulWidget {
  @override
  _findClinicMainState createState() => _findClinicMainState();
}

class _findClinicMainState extends State<findClinicMain> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height,
      color: Colors.grey[100],
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: ListTile(),
              )
            ],
          )),
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ListTile(
                  title: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.red.shade400,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Mitr'),
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "ค้นหาคลินิก"),
                            // your TextField's Content
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4
                            // changes position of shadow
                            ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    child: IconButton(
                      icon: new Icon(
                        FontAwesomeIcons.filter,
                        size: 25,
                      ),
                      color: Colors.red.shade400,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_FilterClinic()));
                      },
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4
                            // changes position of shadow
                            ),
                      ],
                    ),
                  ))),
          Expanded(
              child: ListView(
            children: [
              ClinicCard(),
            ],
          )),
        ],
      ),
    );
  }
}
