import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/component/mypet_petInfo.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:intl/intl.dart';

class Page_Edit_PetInformaition extends StatefulWidget {
  final String pid;

  const Page_Edit_PetInformaition({Key key, this.pid}) : super(key: key);

  @override
  _Page_Edit_PetInformaitionState createState() =>
      _Page_Edit_PetInformaitionState();
}

class _Page_Edit_PetInformaitionState extends State<Page_Edit_PetInformaition> {
  var data;

  final _formkey = GlobalKey<FormState>();

  final editPetName = TextEditingController();
  var editPetGender = TextEditingController();
  var editPetCategory = TextEditingController();
  final editPetColor = TextEditingController();
  final editPetBreed = TextEditingController();
  var editPetSterilize;
  final editPetCharacteristics = TextEditingController();
  final editCongenitalDisease = TextEditingController();
  final editVaccine = TextEditingController();
  final editPetAge = TextEditingController();
  String sterilization = "";
  List listCategory = ["สุนัข", "แมว"];
  List listGender = ["เพศผู้", "เพศเมีย"];
  List listSterilize = [
    'ทำหมันแล้ว',
    'ยังไม่ทำหมัน',
  ];
  String valueGender;
  String valueCategory;
  String valueSterilize;

  getPetDetail() async {
    print("PID :  ${widget.pid}");
    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
    setState(() {
      data = json.decode(response.body);
    });
    print(data);
    showPetInformation();
    return data;
  }

  updatePetInformation() async {
    await setData();
    if (editPetSterilize == "ทำหมันแล้ว") {
      setState(() {
        editPetSterilize = "true";
      });
      print(editPetSterilize);
    } else {
      editPetSterilize = "false";
      print(editPetSterilize);
    }
    http.Response response = await http
        .post(Uri.parse(
            '$Url/pet_detail/editPetDetail/$pid/${editPetName.text}/${editPetCategory}/${editPetGender}/${editPetColor.text}/${editPetBreed.text}/${editPetAge.text}/${editPetCharacteristics.text}/${editPetSterilize}/${editCongenitalDisease.text}/${editVaccine.text}'))
        .then((value) {
      print("Update success");
    });
  }

  @override
  void initState() {
    super.initState();
    //showOwnerDetail();
    getPetDetail();
  }

  setData() {
    if (editPetName.text != data['pet_name']) {
      editPetName.text = editPetName.text;
    } else {
      editPetName.text = data['pet_name'];
    }
    if (editPetCategory.text != data['type']) {
      editPetCategory.text = editPetCategory.text;
    } else {
      editPetCategory.text = data['type'];
    }
    if (editPetGender.text != data['sex']) {
      editPetGender.text = editPetGender.text;
    } else {
      editPetGender.text = data['sex'];
    }
    if (editPetColor.text != data['color']) {
      editPetColor.text = editPetColor.text;
    } else {
      editPetColor.text = data['color'];
    }
    if (editPetBreed.text != data['breed']) {
      editPetBreed.text = editPetBreed.text;
    } else {
      editPetBreed.text = data['breed'];
    }
    if (editPetCharacteristics.text != data['characteristics']) {
      editPetCharacteristics.text = editPetCharacteristics.text;
    } else {
      editPetCharacteristics.text = data['characteristics'];
    }
    if (editPetAge.text != data['dob']) {
      editPetAge.text = editPetAge.text;
    } else {
      editPetAge.text = data['dob'];
    }
    if (editPetSterilize.text != data['sterilization']) {
      editPetSterilize.text = editPetSterilize.text;
    } else {
      editPetSterilize.text = data['sterilization'];
    }
    if (editCongenitalDisease.text != data['congenital_disease']) {
      editCongenitalDisease.text = editCongenitalDisease.text;
    } else {
      editCongenitalDisease.text = data['congenital_disease'];
    }
    if (editVaccine.text != data['vaccine'][0]) {
      editVaccine.text = editVaccine.text;
    } else {
      editVaccine.text = data['vaccine'][0];
    }
  }

  showPetInformation() {
    setState(() {
      editPetName.text = data['pet_name'];
      editPetCategory.text = data['type'];
      editPetGender.text = data['sex'];
      editPetColor.text = data['color'];
      editPetBreed.text = data['breed'];
      editPetCharacteristics.text = data['characteristics'];
      editPetAge.text = data['dob'];
      editPetSterilize = data['sterilization'];
      editCongenitalDisease.text = data['congenital_disease'];
      editVaccine.text = data['vaccine'][0];

      if (data['sterilization'] == true) {
        return editPetSterilize = "ทำหมันแล้ว";
      } else {
        return editPetSterilize = "ยังไม่ทำหมัน";
      }
    });
  }

  DateTime date;
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: DateTime(1970),
        lastDate: now);
    if (picked != null && picked != date) {
      setState(() {
        editPetAge.text = DateFormat('MM-dd-yyyy').format(picked);
      });
      print(editPetAge.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.tealAccent.shade700.withOpacity(0.15),
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: Text(
            "แก้ไขข้อมูลสัตว์เลี้ยง",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr'),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await updatePetInformation();
                  Navigator.pop(context, true);
                },
                icon: Icon(
                  FontAwesomeIcons.check,
                  color: Colors.white,
                ))
            // icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: data != null
            ? Column(
                children: <Widget>[
                  Container(
                    child: Container(
                        child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10, top: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/1.jpg',
                                height: 140,
                                width: 140,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  Expanded(
                      child: Container(
                    // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: ListView(
                      // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      padding: EdgeInsets.zero,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "ชื่อ :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: editPetName,
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '-';
                                      }
                                      return "-";
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        editPetName.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                title: Text(
                                  "ประเภท :",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                subtitle: DropdownButtonFormField(
                                  icon: Icon(
                                    // Add this
                                    Icons.arrow_drop_down, // Add this
                                    color: Colors.grey.shade600, // Add this
                                  ),
                                  hint: Text(editPetCategory.text,
                                      style: TextStyle(
                                          color: Colors.teal.shade600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Mitr')),
                                  isDense: false,
                                  decoration:
                                      InputDecoration.collapsed(hintText: ''),
                                  dropdownColor: Colors.white,
                                  value: valueCategory,
                                  style: TextStyle(
                                      color: Colors.teal.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueGender = newValue;
                                      editPetCategory = newValue;
                                    });
                                    print("Sex : $valueGender");
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return valueCategory =
                                          editPetCategory.text;
                                    }
                                    return valueCategory = editPetCategory.text;
                                  },
                                  items: listCategory.map((valueItem) {
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(
                                          valueItem,
                                        ));
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                title: Text(
                                  "เพศ :",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                subtitle: DropdownButtonFormField(
                                  icon: Icon(
                                    // Add this
                                    Icons.arrow_drop_down, // Add this
                                    color: Colors.grey.shade600, // Add this
                                  ),
                                  hint: Text(editPetGender.text,
                                      style: TextStyle(
                                          color: Colors.teal.shade600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Mitr')),
                                  isDense: false,
                                  decoration:
                                      InputDecoration.collapsed(hintText: ''),
                                  dropdownColor: Colors.white,
                                  value: valueGender,
                                  style: TextStyle(
                                      color: Colors.teal.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueGender = newValue;
                                      editPetGender = newValue;
                                    });
                                    print("Sex : $valueGender");
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return valueGender = editPetGender.text;
                                    }
                                    return valueGender = editPetGender.text;
                                  },
                                  items: listGender.map((valueItem) {
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(
                                          valueItem,
                                        ));
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "สี :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: editPetColor,
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '-';
                                      }
                                      return "-";
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        editPetColor.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "สายพันธุ์ :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: editPetBreed,
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '-';
                                      }
                                      return "-";
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        editPetBreed.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "ลักษณะเฉพาะ :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: editPetCharacteristics,
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '-';
                                      }
                                      return "-";
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        editPetCharacteristics.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                title: Text(
                                  "วันเกิด / วันที่รับเลี้ยง :",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                subtitle: TextFormField(
                                  controller: editPetAge,
                                  style: TextStyle(
                                      color: Colors.teal.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  onTap: () async {
                                    // Below line stops keyboard from appearing
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    // Show Date Picker Here
                                    await _selectDate(context);
                                    // _addPetAge.text =
                                    //     DateFormat('dd/MM/yyyy').format(date);
                                    //setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                title: Text(
                                  "การทำหมัน :",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                subtitle: DropdownButtonFormField(
                                  hint: Text(
                                    editPetSterilize,
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  isDense: false,
                                  decoration:
                                      InputDecoration.collapsed(hintText: ''),
                                  dropdownColor: Colors.white,
                                  value: valueSterilize,
                                  style: TextStyle(
                                      color: Colors.teal.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueSterilize = newValue;
                                      editPetSterilize = newValue;

                                      if (editPetSterilize == "ทำหมันแล้ว") {
                                        editPetSterilize = true;
                                      } else {
                                        editPetSterilize = false;
                                      }
                                    });
                                    print(editPetSterilize);
                                  },
                                  items: listSterilize.map((valueItem) {
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(
                                          valueItem,
                                        ));
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "โรคประจำตัว :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: editCongenitalDisease,
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '-';
                                      }
                                      return "-";
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        editCongenitalDisease.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "วัคซีนที่ได้รับ :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: editVaccine,
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '-';
                                      }
                                      return "-";
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        editVaccine.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}
