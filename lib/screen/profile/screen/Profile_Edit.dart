import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_paw/screen/profile/component/profile_informationCard.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Page_EditProfile extends StatefulWidget {
  static const routeName = '/setting';

  @override
  State<StatefulWidget> createState() {
    return _Page_EditProfileState();
  }
}

class _Page_EditProfileState extends State<Page_EditProfile> {
  var data;

  final _formkey = GlobalKey<FormState>();

  final user_name = TextEditingController();
  final user_contact = TextEditingController();
  var user_gender;

  // List listGender = ["ชาย", "หญิง", "ไม่ระบุ"];
  List listGender = ["หญิง", "ชาย", "อื่นๆ"];
  String valueGender;
  String urlImage;
  ImagePicker picker = ImagePicker();
  File _imageFile;

  getUserInformation() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;
    http.Response response =
        await http.get(Uri.parse('$Url/owner/showByID/$uid'));
    if (this.mounted) {
      this.setState(() {
        this.data = jsonDecode(response.body);
      });
    }
    showUserProfile();
    return data;
  }

  updateUserProfile() async {
    if (_imageFile != null) {
      await uploadImageToFirebase();
    } else {
      await setData();
    }
    // if (user_name == null || user_name.text.isEmpty) {
    //   user_name.text = "-";
    //   return user_name.text = "-";
    // }
    // if (user_gender != data['sex']) {
    //   user_gender = user_gender;
    // } else {
    //   user_gender = data['sex'];
    // }
    // if (user_contact == null || user_contact.text.isEmpty) {
    //   user_contact.text = "-";
    //   return user_contact.text = "-";
    // }

    http.Response response =
        await http.put(Uri.parse('$Url/owner/editUserProfile/$uid'), body: {
      'name': '${user_name.text}',
      'contact': '${user_contact.text}',
      'sex': '$user_gender',
      'urlImage': '$urlImage'
    }).then((value) {});
    print(
        '$uid    ${user_name.text}/  ${user_contact.text}/     ${valueGender}');
    print("Update success");
  }

  @override
  void initState() {
    super.initState();
    //showOwnerDetail();
    getUserInformation();
  }

  setData() {
    if (user_name.text != data['name']) {
      user_name.text = user_name.text;
    } else {
      user_name.text = data['name'];
    }

    if (user_contact.text != data['contact']) {
      user_contact.text = user_contact.text;
    } else {
      user_contact.text = data['contact'];
    }

    if (user_gender != data['sex']) {
      user_gender = user_gender;
    } else {
      user_gender = data['sex'];
    }

    if (this.urlImage != data['urlImage']) {
      print("ของใหม่ :" + urlImage);
    } else {
      urlImage = data['urlImage'];
      print("ของเดิม :" + urlImage);
    }
  }

  showUserProfile() {
    if (this.mounted) {
      setState(() {
        user_name.text = data['name'];
        user_contact.text = data['contact'];
        user_gender = data['sex'];
        urlImage = data['urlImage'];
      });
    }
  }

  Future pickImage(ImageSource source) async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile == null) return;

    final imageTemporary = File(pickedFile.path);
    setState(() {
      this._imageFile = imageTemporary;
    });
  }

  Future<void> uploadImageToFirebase() async {
    Random random = Random();
    int random_number = random.nextInt(1000000);

    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    firebase_storage.UploadTask uploadTask = firebase_storage
        .FirebaseStorage.instance
        .ref('owner_images/Owner$random_number.jpg')
        .putFile(_imageFile);

    urlImage = await (await uploadTask).ref.getDownloadURL();
    print("urlImage : " + urlImage);
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "แก้ไขโปรไฟล์",
            style: TextStyle(
                fontSize: 22,
                color: Colors.red.shade300,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mitr'),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await updateUserProfile();
                  Navigator.pop(context, true);
                },
                icon: Icon(
                  FontAwesomeIcons.solidCheckCircle,
                  color: Colors.green.shade300,
                ))
            // icon: Icon(Icons.exit_to_app))
          ],
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: data != null
            ? Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: size.height * 0.1),
                child: Column(
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
                                child: data == null
                                    ? null
                                    : Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 65,
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            child: ClipOval(
                                              child: SizedBox(
                                                  width: 140.0,
                                                  height: 140.0,
                                                  child: (_imageFile != null)
                                                      ? Image.file(
                                                          _imageFile,
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image.network(
                                                          urlImage,
                                                          fit: BoxFit.fill,
                                                        )),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.photo_library),
                                                onPressed: () {
                                                  pickImage(
                                                      ImageSource.gallery);
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.photo_camera),
                                                onPressed: () {
                                                  pickImage(ImageSource.camera);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ))
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                child: ListTile(
                                    title: Text(
                                      "ชื่อ :",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Mitr'),
                                    ),
                                    subtitle: TextFormField(
                                      controller: user_name,
                                      style: TextStyle(
                                          color: Colors.black,
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
                                          user_name.clear();
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.solidTimesCircle,
                                          size: 16,
                                          color: Colors.grey,
                                        ))),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10)),
                          //     color: Colors.white,
                          //     border: Border.all(width: 1.0, color: Colors.grey[200]),
                          //   ),
                          //   child: Padding(
                          //     padding: EdgeInsets.only(top: 10, bottom: 10),
                          //     child: Container(
                          //       child: ListTile(
                          //           title: Text(
                          //             "เบอร์มือถือ :",
                          //             overflow: TextOverflow.ellipsis,
                          //             style: TextStyle(
                          //                 color: Colors.black54,
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.w400,
                          //                 fontFamily: 'Mitr'),
                          //           ),
                          //           subtitle: TextFormField(
                          //             controller: user_contact,
                          //             style: TextStyle(
                          //                 color: Colors.black.shade300,
                          //                 fontSize: 16,
                          //                 fontWeight: FontWeight.w400,
                          //                 fontFamily: 'Mitr'),
                          //             decoration: InputDecoration(
                          //               contentPadding: EdgeInsets.zero,
                          //               border: InputBorder.none,
                          //               focusedBorder: InputBorder.none,
                          //             ),
                          //             onSaved: (String value) {},
                          //             validator: (value) {
                          //               if (value == null || value.isEmpty) {
                          //                 print("null");
                          //                 return 'กรุณาระบุ';
                          //               }
                          //               return null;
                          //             },
                          //           ),
                          //           trailing: IconButton(
                          //               onPressed: () {
                          //                 user_contact.clear();
                          //               },
                          //               icon: Icon(
                          //                 FontAwesomeIcons.solidTimesCircle,
                          //                 size: 16,
                          //                 color: Colors.grey,
                          //               ))),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10)),
                          //     color: Colors.white,
                          //     border: Border.all(width: 1.0, color: Colors.grey[200]),
                          //   ),
                          //   child: Padding(
                          //     padding: EdgeInsets.only(top: 10, bottom: 10),
                          //     child: Container(
                          //       child: ListTile(
                          //         title: Text(
                          //           "เพศ :",
                          //           overflow: TextOverflow.ellipsis,
                          //           style: TextStyle(
                          //               color: Colors.black54,
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w400,
                          //               fontFamily: 'Mitr'),
                          //         ),
                          //         subtitle: Container(
                          //           padding:
                          //               EdgeInsets.only(right: size.width * 0.03),
                          //           child: DropdownButtonFormField(
                          //             icon: Icon(
                          //               Icons.arrow_drop_down,
                          //             ),
                          //             hint: Text(user_gender,
                          //                 style: TextStyle(
                          //                     color: Colors.black.shade300,
                          //                     fontSize: 16,
                          //                     fontWeight: FontWeight.w400,
                          //                     fontFamily: 'Mitr')),
                          //             isDense: false,
                          //             decoration:
                          //                 InputDecoration.collapsed(hintText: ''),
                          //             dropdownColor: Colors.white,
                          //             value: valueGender,
                          //             style: TextStyle(
                          //                 color: Colors.black.shade300,
                          //                 fontSize: 16,
                          //                 fontWeight: FontWeight.w400,
                          //                 fontFamily: 'Mitr'),
                          //             onChanged: (newValue) {
                          //               setState(() {
                          //                 valueGender = newValue;
                          //                 user_gender = newValue;
                          //               });
                          //               print("Sex : $valueGender");
                          //             },
                          //             validator: (value) {
                          //               if (value == null || value.isEmpty) {
                          //                 return valueGender = user_gender.text;
                          //               }
                          //               return valueGender = user_gender.text;
                          //             },
                          //             items: listGender.map((valueItem) {
                          //               return DropdownMenuItem(
                          //                   value: valueItem,
                          //                   child: Text(
                          //                     valueItem,
                          //                   ));
                          //             }).toList(),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(10)),
                          //     color: Colors.white,
                          //     border: Border.all(
                          //         width: 1.0, color: Colors.grey[200]),
                          //   ),
                          //   child: Padding(
                          //     padding: EdgeInsets.only(top: 10, bottom: 10),
                          //     child: Container(
                          //       child: ListTile(
                          //         title: Text(
                          //           "เพศ :",
                          //           overflow: TextOverflow.ellipsis,
                          //           style: TextStyle(
                          //               color: Colors.black54,
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w400,
                          //               fontFamily: 'Mitr'),
                          //         ),
                          //         subtitle: DropdownButtonFormField(
                          //           icon: Icon(
                          //             // Add this
                          //             Icons.arrow_drop_down, // Add this
                          //             color: Colors.grey.shade600, // Add this
                          //           ),
                          //           hint: Text(user_gender.text,
                          //               style: TextStyle(
                          //                   color: Colors.black.shade300,
                          //                   fontSize: 16,
                          //                   fontWeight: FontWeight.w400,
                          //                   fontFamily: 'Mitr')),
                          //           isDense: false,
                          //           decoration:
                          //               InputDecoration.collapsed(hintText: ''),
                          //           dropdownColor: Colors.white,
                          //           value: valueGender,
                          //           style: TextStyle(
                          //               color: Colors.black.shade300,
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.w400,
                          //               fontFamily: 'Mitr'),
                          //           onChanged: (newValue) {
                          //             setState(() {
                          //               valueGender = newValue;
                          //               user_gender.text = newValue;
                          //             });
                          //           },
                          //           items: listGender.map((valueItem) {
                          //             return DropdownMenuItem(
                          //                 value: valueItem,
                          //                 child: Text(
                          //                   valueItem,
                          //                 ));
                          //           }).toList(),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ))
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
