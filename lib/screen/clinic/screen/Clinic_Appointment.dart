import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:little_paw/database/database.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Clinic_Done_Appointment.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// connection

// Calendar
class Page_Appointment extends StatefulWidget {
  const Page_Appointment({Key key}) : super(key: key);

  @override
  _Page_AppointmentState createState() => _Page_AppointmentState();
}

class _Page_AppointmentState extends State<Page_Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(),
        Appointment(),
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
              "การนัดหมาย",
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

// Text input
class Appointment extends StatefulWidget {
  // final ContactApi api = ContactApi();

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final time_appointment = TextEditingController();
  final symptom = TextEditingController();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String formattedDate;
  DateTime aa;

  List data;
  Future<String> getAppointment() async {
    http.Response response = await http.get(Uri.parse('$Url/clinic'));

    setState(() {
      var resBody = json.decode(response.body);
      data = resBody;
    });
    print(data[0]);
    return "Success";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getAppointment();
  }
  // getAppointment() async{
  //   http.Response response = await http.get(Uri.parse('$Url/clinic'));
  //   this.setState(() {
  //      data = json.decode(response.body);
  //   });
  //   print(data[0]['cid']);
  //   return data;
  // }

  // List _data;
  // @override
  // void initState()  {
  //     if(getAppointment() == null){
  //       super.initState();
  //     }else{
  //       super.initState();
  //       _data = getAppointment();
  //     }
  // }

  void getData(String time_appointment, String symptom, DateTime date) async {
    // createAppointment(time_appointment, symptom, date);
    // await data();
    // startTime();
    print("success");
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Page_AppointmentSuccess();
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.14),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTile(
                        title: Text(
                          "วันที่นัดหมาย",
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        child: TableCalendar(
                          focusedDay: selectedDay,
                          firstDay: DateTime(1990),
                          lastDay: DateTime(2050),
                          calendarFormat: format,
                          onFormatChanged: (CalendarFormat _format) {
                            setState(() {
                              format = _format;
                            });
                          },
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          daysOfWeekVisible: true,

                          // Day Changed
                          onDaySelected:
                              (DateTime selectDay, DateTime focusDay) {
                            setState(() {
                              selectedDay = selectDay;
                              focusedDay = focusDay;
                            });
                            // print(focusedDay);
                          },
                          selectedDayPredicate: (DateTime date) {
                            return isSameDay(selectedDay, date);
                          },
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                              color: Colors.red.shade400,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mitr',
                              fontSize: 14,
                            ),
                          ),
                          headerStyle: HeaderStyle(
                              formatButtonVisible: true,
                              titleCentered: true,
                              formatButtonShowsNext: true,
                              formatButtonDecoration: BoxDecoration(
                                  color: Colors.red.shade300,
                                  borderRadius: BorderRadius.circular(5.0)),
                              formatButtonTextStyle:
                                  TextStyle(color: Colors.white),
                              leftChevronVisible: false,
                              rightChevronVisible: false,
                              headerPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTile(
                        title: Text(
                          "เวลาที่นัดหมาย",
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        // child: InputText(
                        //   hintText: 'ระบุช่วงเวลา',
                        //   onChanged: (String value) {},
                        // ),
                        child: TextField(
                          controller: time_appointment,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ระบุช่วงเวลา',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTile(
                        title: Text(
                          data == null ? "" : data[0]['doctor_name'],
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        // child: InputText(
                        //   hintText: 'ระบุอาการ',
                        //   onChanged: (String value) {},
                        // ),
                        child: TextField(
                          controller: symptom,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ระบุอาการ',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        )),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: size.width * 1,
                      height: size.height * 0.06,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: FlatButton(
                            color: Colors.red.shade400,
                            onPressed: () {
                              // getAppointment();
                              setState(() {
                                formattedDate =
                                    DateFormat('dd-MM-yyyy').format(focusedDay);
                                aa =  DateFormat("dd-M-yyyy hh:mm:ss").parse(formattedDate);
                              });
                              print(formattedDate);
                              print(aa);
                              getData(time_appointment.text, symptom.text,
                                  focusedDay);
                            },
                            child: Text(
                              "ยืนยัน",
                              style: TextStyle(
                                fontFamily: 'Mitr',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
