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
  final date_appointment = TextEditingController();

  var data;
  var petselected;
  var pidselected;

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String formattedDate;
  DateTime aa;

  String _selectedTime;
  String valueSterilize;

  List listpet = [];
  List listPID = [];

  List listSterilize = [
    'ทำหมันแล้ว',
    'ยังไม่ทำหมัน',
  ];

  bool _clicked = false;

  getPetList() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;

    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showByID/$uid'));
    setState(() {
      data = json.decode(response.body);
    });
    for (var index = 0; index < data.length; index++) {
      listpet.add("${index + 1}. " + data[index]['pet_name']);
      listPID.add(data[index]['_id']);
    }
    return data;
  }

  createAppointment() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;
    http.Response response =
        await http.post(Uri.parse('$Url/appointment/addappointment'), body: {
      'cid': '${widget.cid}',
      'clinic_name': '${widget.clinic_name}',
      'doctor_name': '${widget.doctor_name}',
      'userID': '$uid',
      'pid': '$pidselected',
      'date': '$date_appointment',
      'time_appointment': '${time_appointment.text}',
      'symptom': '${symptom.text}'
    });

    print("cid : " + widget.cid);
    print("Clinic Nmae : " + widget.clinic_name);
    print("Doctor Nmae : " + widget.doctor_name);
    print("PID : " + pidselected);
    print("uid : " + uid);
    print("Date : " + date_appointment.text);
    print("time : " + time_appointment.text);
    print("symptom : " + symptom.text);

    startTime();
  }

  @override
  void initState() {
    super.initState();
    getPetList();
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

  DateTime date;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2025));
    builder:
    if (picked != null && picked != date) {
      setState(() {
        date_appointment.text = DateFormat('dd-MM-yyyy').format(picked);
      });
      print(date_appointment.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
                    padding: EdgeInsets.only(bottom: size.height * 0.1),
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
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 5),
                          child: InkWell(
                            onTap: () {
                              _selectDate(
                                  context); // Call Function that has showDatePicker()
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: date_appointment,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                                decoration: InputDecoration(
                                  hintText: "ระบุวันที่",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ),
                                onSaved: (String value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'กรุณาระบุวันที่';
                                  }
                                  return null;
                                },
                              ),
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
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 5),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ListTile(
                            title: Text(
                              "สัตว์เลี้ยงของคุณ",
                              style: TextStyle(
                                fontFamily: 'Mitr',
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 4.0, color: Colors.grey[100]),
                          ),
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
                          padding: EdgeInsets.fromLTRB(10, 0, 30, 5),
                          child: DropdownButtonFormField(
                            hint: Text(
                              "เลือกสัตว์เลี้ยง",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                            ),
                            isDense: false,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            dropdownColor: Colors.white,
                            value: valueSterilize,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            onChanged: (newValue) {
                              setState(() {
                                valueSterilize = newValue;
                                petselected = newValue;
                                for (var i = 0; i < listpet.length; i++) {
                                  if (petselected == listpet[i]) {
                                    pidselected = listPID[i];
                                  }
                                }
                              });
                              print(pidselected);
                              print(petselected);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุสัตว์';
                              }
                              return null;
                            },
                            items: listpet.map((valueItem) {
                              return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                  ));
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ListTile(
                            title: Text(
                              "อาการเบื้องต้น",
                              style: TextStyle(
                                fontFamily: 'Mitr',
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 5),
                          child: TextFormField(
                            controller: symptom,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
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
                                color: Colors.red.shade300,
                                onPressed: _clicked
                                    ? null
                                    : () {
                                        if (_formkey.currentState.validate()) {
                                          _clicked = true;
                                          // if(petselected == )
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
                                    fontWeight: FontWeight.w400,
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
                    color: Colors.red.shade300,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mitr'),
              ), // You can add title here
              leading: new IconButton(
                icon:
                    new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
        ]),
      ),
    );
  }
}
