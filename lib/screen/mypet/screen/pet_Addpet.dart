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
    return Container(
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
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black45,
                    //       offset: Offset(2, 2),
                    //       blurRadius: 4
                    //       // changes position of shadow
                    //       ),
                    // ],
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 40,
                    color: Colors.red.shade400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.amber,
                  border: Border.all(width: 1.0, color: Colors.grey[200])),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 2, 5),
                    // padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "AA",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Mitr'),
                        ),
                        Row(
                          children: [
                            Text(
                              "SS",
                              style: TextStyle(
                                  color: Colors.red.shade400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                            ),
                            // IconButton(
                            //   icon: Icon(Icons.arrow_right),
                            //   iconSize: 25,
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => MyPet()));
                            //   },
                            // ),
                            Icon(
                              Icons.arrow_right,
                              size: 25,
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
