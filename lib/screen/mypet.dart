import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/component/PetInfo.dart';
import 'package:little_paw/screen/mypet/component/PetList.dart';
import 'package:little_paw/screen/mypet/screen/pet_Addpet.dart';
import 'package:little_paw/screen/mypet/component/PetCard.dart';
import 'package:little_paw/screen/mypet/screen/pet_Select.dart';
import 'package:little_paw/screen/mypet/component/PetCard.dart';

// import 'mypet/component/PetCard.dart';
// import './mypet/screen/pet_Select.dart';
import 'mypet/component/PetCardInfo.dart';

class MyPet extends StatefulWidget {
  const MyPet({Key key}) : super(key: key);

  @override
  _MyPetState createState() => _MyPetState();
}

class _MyPetState extends State<MyPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPet(),
      appBar: AppBar(
        title: Text("สัตว์เลี้ยงของฉัน",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr')),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.plusCircle,
                color: Colors.red.shade400,
                size: 30,
              ),
              tooltip: 'เพิ่มสัตว์เลี้ยง',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page_AddPet()));
                // setState(() {});
              },
            ),
          ),
        ],
        backgroundColor: Colors.white, //You can make this transparent
        elevation: 5.0, //No shadow
      ),
    );
  }
}

class mainPet extends StatefulWidget {
  @override
  _mainPetState createState() => _mainPetState();
}

class _mainPetState extends State<mainPet> {
  final List<String> image = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg'
  ];

  final details = [
    ["assets/images/1.jpg", "ปีโป้"],
    ["assets/images/2.jpg", "บราวนี่"],
    ["assets/images/3.jpg", "เป๊ปซี่"],
  ];

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200.0,
        children: <Widget>[
          PetList(petname: "ปีโป้"),
          PetList(petname: "ป๊อปปี้"),
          PetList(petname: "ซีซ่า"),
          PetList(petname: "จัมโบ้"),
          PetList(petname: "โอรีโอ้"),
        ],
      )),
    );
    // return GridView.count(
    //   crossAxisCount: 2,
    //   children: [
    //     ...details.map(
    //       (i) => Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Card(
    //             elevation: 3.0,
    //             child: Image.asset(
    //               i.first,
    //               fit: BoxFit.fitWidth,
    //               height: 100,
    //               width: 100,
    //             ),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: Container(
    //               alignment: Alignment.center,
    //               padding: EdgeInsets.all(5),
    //               child: Text(i.last),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );

    // return Container(
    //   child: Center(
    //       child: GridView.extent(
    //     primary: false,
    //     padding: const EdgeInsets.all(20),
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //     maxCrossAxisExtent: 200.0,
    //     children: image
    //         .map((item) => Card(
    //               color: Colors.amber,

    //               // child: Container(
    //               //   decoration: BoxDecoration(
    //               //       borderRadius: BorderRadius.circular(10),
    //               //       image: DecorationImage(
    //               //           scale: 1,
    //               //           image: AssetImage(item),
    //               //           fit: BoxFit.cover)),
    //               // ),
    //             ))
    //         .toList(),
    //     // children: <Widget>[
    //     //   PetList(petname: "ปีโป้"),
    //     //   PetList(petname: "ป๊อปปี้"),
    //     //   PetList(petname: "ซีซ่า"),
    //     //   PetList(petname: "บราวนี่"),
    //     // ],
    //   )),
    // );
    // return Scaffold(
    //   floatingActionButton: FloatingActionButton(
    //     backgroundColor: Colors.red,
    //     child: Icon(Icons.add),
    //     onPressed: () {
    //       setState(() {
    //         gridChild.add(Container(
    //           margin: EdgeInsets.all(8.0),
    //           width: 30.0,
    //           height: 50.0,
    //           color: Colors.green,
    //         ));
    //         print(gridChild.length);
    //       });
    //     },
    //   ),
    //   body: GridView.builder(
    //     itemCount: gridChild.length,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       return gridChild[index];
    //     },
    //   ),
    // );
    // return CustomScrollView(
    //   primary: false,
    //   slivers: <Widget>[
    //     SliverPadding(
    //       padding: const EdgeInsets.all(10),
    //       sliver: SliverGrid.count(
    //         crossAxisSpacing: 10,
    //         mainAxisSpacing: 10,
    //         crossAxisCount: 2,
    //         children: <Widget>[
    //           PetList(petname: "ปีโป้"),
    //           PetList(petname: "เฉาก๊วย"),
    //           PetList(petname: "โอเลี้ยง")
    //           // Card(
    //           //   shape: RoundedRectangleBorder(
    //           //     borderRadius: BorderRadius.circular(10),
    //           //   ),
    //           //   child: Text("He'd have you all unravel at the"),
    //           //   color: Colors.white,
    //           // ),
    //           // Card(
    //           //   shape: RoundedRectangleBorder(
    //           //     borderRadius: BorderRadius.circular(10),
    //           //   ),
    //           //   child: Text("He'd have you all unravel at the"),
    //           //   color: Colors.white,
    //           // ),
    //           // Card(
    //           //   shape: RoundedRectangleBorder(
    //           //     borderRadius: BorderRadius.circular(10),
    //           //   ),
    //           //   child: Text("He'd have you all unravel at the"),
    //           //   color: Colors.white,
    //           // ),
    //           // Card(
    //           //   shape: RoundedRectangleBorder(
    //           //     borderRadius: BorderRadius.circular(10),
    //           //   ),
    //           //   child: Text("He'd have you all unravel at the"),
    //           //   color: Colors.white,
    //           // ),
    //           // Card(
    //           //   shape: RoundedRectangleBorder(
    //           //     borderRadius: BorderRadius.circular(10),
    //           //   ),
    //           //   child: Text("He'd have you all unravel at the"),
    //           //   color: Colors.white,
    //           // ),
    //           // Card(
    //           //   shape: RoundedRectangleBorder(
    //           //     borderRadius: BorderRadius.circular(10),
    //           //   ),
    //           //   child: Text("He'd have you all unravel at the"),
    //           //   color: Colors.white,
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
    // return GridView.count(
    //   primary: false,
    //   padding: EdgeInsets.all(20),
    //   crossAxisSpacing: 10,
    //   mainAxisSpacing: 10,
    //   crossAxisCount: 2,
    //   children: <Widget>[
    //     Container(
    //       padding: EdgeInsets.all(8),
    //       child: Text('Heed not the rabble'),
    //       color: Colors.teal[200],
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(8),
    //       child: Text('Sound of screams but the'),
    //       color: Colors.teal[300],
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(8),
    //       child: Text('Who scream'),
    //       color: Colors.teal[400],
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(8),
    //       child: Text('Revolution is coming...'),
    //       color: Colors.teal[500],
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(8),
    //       child: Text('Revolution, they...'),
    //       color: Colors.teal[600],
    //     ),
    //   ],
    // );
    // return Container(
    //   child: Padding(
    //     padding: const EdgeInsets.all(.0),
    //     child: GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2, mainAxisSpacing: 2),
    //         itemBuilder: (BuildContext, i) {
    //           for (i = 0; i < values.length; i++) {}
    //           return Padding(
    //             padding: const EdgeInsets.all(2.0),
    //             child: SizedBox(
    //               height: 400,
    //               width: 200,
    //               child: InkWell(
    //                 onTap: () {},
    //                 child: Stack(
    //                   children: <Widget>[
    //                     ClipRRect(
    //                         borderRadius: BorderRadius.all(Radius.circular(20)),
    //                         child: Image.asset(
    //                           values[i]['categorybackimage'],
    //                           fit: BoxFit.fill,
    //                         )),
    //                     Column(
    //                       children: <Widget>[
    //                         Text("${(values[i]['category'])}"),
    //                         Card(
    //                           color: Colors.white,
    //                           child: Text(
    //                             "عروض ",
    //                             style: TextStyle(
    //                                 color: Colors.red,
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w900),
    //                           ),
    //                         ),
    //                         Image.asset(
    //                           values[i]['categoryimage'],
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           );
    //         }),
    //   ),
    // );

    // return Container(
    //   height: size.height,
    //   color: Colors.grey[100],
    //   child: Column(
    //     children: [
    //       Expanded(
    //           child: ListView(
    //         children: [
    //           Column(
    //             children: [
    //               Container(
    //                   margin: EdgeInsets.only(
    //                     top: 20,
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         // padding: EdgeInsets.only(top: 10, bottom: 10),
    //                         child: Row(
    //                           children: [
    //                             InkWell(
    //                               splashColor: Colors.red.shade100,
    //                               onTap: () {
    //                                 Navigator.of(context).push(
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             Page_SelectPet()));
    //                               },
    //                               child: Container(
    //                                 child: PetList(
    //                                   petname: "Abby",
    //                                   //
    //                                 ),
    //                               ),
    //                             ),
    //                             InkWell(
    //                               splashColor: Colors.red.shade100,
    //                               onTap: () {
    //                                 Navigator.of(context).push(
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             Page_SelectPet()));
    //                               },
    //                               child: Container(
    //                                 child: PetList(
    //                                   petname: "Bobby",
    //                                   //
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Container(
    //                         // padding: EdgeInsets.only(top: 10, bottom: 10),
    //                         child: Row(
    //                           children: [
    //                             InkWell(
    //                               splashColor: Colors.red.shade100,
    //                               onTap: () {
    //                                 Navigator.of(context).push(
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             Page_SelectPet()));
    //                               },
    //                               child: Container(
    //                                 child: PetList(
    //                                   petname: "Cassy",
    //                                   //
    //                                 ),
    //                               ),
    //                             ),
    //                             InkWell(
    //                               splashColor: Colors.red.shade100,
    //                               onTap: () {
    //                                 Navigator.of(context).push(
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             Page_SelectPet()));
    //                               },
    //                               child: Container(
    //                                 child: PetList(
    //                                   petname: "Dexy",
    //                                   //
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Container(
    //                         // padding: EdgeInsets.only(top: 10, bottom: 10),
    //                         child: Row(
    //                           children: [
    //                             InkWell(
    //                               splashColor: Colors.red.shade100,
    //                               onTap: () {
    //                                 Navigator.of(context).push(
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             Page_SelectPet()));
    //                               },
    //                               child: Container(
    //                                 child: PetList(
    //                                   petname: "Eegy",
    //                                   //
    //                                 ),
    //                               ),
    //                             ),
    //                             InkWell(
    //                               splashColor: Colors.red.shade100,
    //                               onTap: () {
    //                                 Navigator.of(context).push(
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             Page_SelectPet()));
    //                               },
    //                               child: Container(
    //                                 child: PetList(
    //                                   petname: "Fixy",
    //                                   //
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Container(
    //                         // padding: EdgeInsets.only(top: 10, bottom: 10),
    //                         child: Row(
    //                           children: [
    //                             InkWell(
    //                               splashColor: Colors.red.shade100,
    //                               onTap: () {
    //                                 Navigator.of(context).push(
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             Page_SelectPet()));
    //                               },
    //                               child: Container(
    //                                 child: PetList(
    //                                   petname: "Gigi",
    //                                   //
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   )),
    //             ],
    //           ),
    //         ],
    //       )),
    //     ],
    //   ),
    // );
  }
}

class Decorate extends StatelessWidget {
  const Decorate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      color: Colors.amber,
      height: 100,
      width: 100,
      child: Column(
        children: [Text("AA"), Text("BB")],
      ),
    );
  }
}
