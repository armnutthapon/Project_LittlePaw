import 'package:flutter/material.dart';

class Page_AddPet extends StatefulWidget {
  const Page_AddPet({Key key}) : super(key: key);

  @override
  _Page_AddPetState createState() => _Page_AddPetState();
}

class _Page_AddPetState extends State<Page_AddPet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        height: size.height,
        child: Column(
          children: [
            Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.red.shade100,
                child: Container(
                  child: Container(
                    height: 190,
                    width: 150,
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
                    child: Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.red.shade400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
