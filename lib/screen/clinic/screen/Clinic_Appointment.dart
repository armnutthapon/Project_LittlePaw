import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_paw/database/database.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Clinic_Done_Appointment.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// connection

// Calendar
class Page_Appointment extends StatefulWidget {
  final String cid;
  final String doctor_name;
  final String clinic_name;

  const Page_Appointment(
      {Key key, this.cid, this.doctor_name, this.clinic_name})
      : super(key: key);

  @override
  _Page_AppointmentState createState() => _Page_AppointmentState();
}

class _Page_AppointmentState extends State<Page_Appointment> {
  final _formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final time_appointment = TextEditingController();
  final symptom = TextEditingController();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String formattedDate;
  DateTime aa;

  String _selectedTime;

  bool _clicked = false;

  createAppointment() async {
    http.Response response = await http
        .post(Uri.parse(
            '$Url/appointment/add/${widget.cid}/$uid/$formattedDate/${time_appointment.text}/${symptom.text}/${widget.clinic_name}/${widget.doctor_name}'))
        .then((value) {
      print("success");
    });

    print("cid : " + widget.cid);
    print("Clinic Nmae : " + widget.clinic_name);
    print("Doctor Nmae : " + widget.doctor_name);

    print("uid : " + uid);
    print("Date : " + formattedDate);
    print("time : " + time_appointment.text);
    print("symptom : " + symptom.text);

    startTime();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getData(String time_appointment, String symptom, DateTime date) async {
    // createAppointment(time_appointment, symptom, date);
    // await data();
    // startTime();
    print("success");
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Page_AppointmentSuccess();
    }));
  }

  Future<void> _show() async {
    final TimeOfDay result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 24-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
              child: childWidget);
        });

    if (result != null) {
      setState(() {
        time_appointment.text = result.format(context);
      });
      print(time_appointment);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formkey,
        child: Stack(children: <Widget>[
          Container(
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
                              firstDay: DateTime(2021),
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
                                  color: Colors.orange.shade600,
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
                                      color: Colors.orange.shade600,
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
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[200]),
                              ),
                              child: Container(
                                height: size.height * 0.07,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: InkWell(
                                  onTap: () {
                                    _show(); // Call Function that has showDatePicker()
                                  },
                                  child: IgnorePointer(
                                    child: TextFormField(
                                      controller: time_appointment,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Mitr'),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: "ระบุช่วงเวลา",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Mitr'),
                                      ),
                                      onSaved: (String value) {},
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'กรุณาระบุช่วงเวลา';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ListTile(
                            title: Text(
                              "อาการเบื้องต้น",
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
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[200]),
                              ),
                              child: Container(
                                height: size.height * 0.07,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: symptom,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: "ระบุอาการ",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Mitr'),
                                  ),
                                  onSaved: (String value) {},
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'กรุณาระบุอาการ';
                                    }
                                    return null;
                                  },
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: size.width * 1,
                          height: size.height * 0.06,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 150,
                              height: 50,
                              child: MaterialButton(
                                color: Colors.green,
                                onPressed: _clicked
                                    ? null
                                    : () {
                                        if (_formkey.currentState.validate()) {
                                          _clicked = true;

                                          setState(() {
                                            formattedDate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(focusedDay);
                                            // aa =  DateFormat("dd-M-yyyy hh:mm:ss").parse(formattedDate);
                                          });
                                          print(formattedDate);
                                          // print(aa);
                                          createAppointment();
                                        }
                                        ;

                                        // getAppointment();
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
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mitr'),
              ), // You can add title here
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.indigoAccent,
              elevation: 10,
            ),
          ),
        ]),
      ),
    );
  }
}
