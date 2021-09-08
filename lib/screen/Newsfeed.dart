import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class Newfeed extends StatelessWidget {
  // const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "กระดานข้อมูล",
          style: TextStyle(
              fontSize: 22,
              color: Colors.red.shade300,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        backgroundColor: Colors.white.withOpacity(1),
        elevation: 0,
      ),
      body: ImagePickerExample(),
    );
  }
}

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key key}) : super(key: key);

  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File image;
  ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedFile.path);
    });
    print(image);

    /// var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  // ImagePicker picker = ImagePicker();
  // String _name, _description, _contact, _cat;
  // File _image;
  // final GlobalKey<FormState> _key = GlobalKey();

  // selectImage() async{
  // final pickedFile = await picker.getImage(source: ImageSource.camera);
  // }

  // Future getImage() async {
  // final pickedFile = await picker.getImage(source: ImageSource.camera);

  // setState(() {
  //   _image = File(pickedFile.path);
  // });
  // }
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);

    return Column(
      children: [
        IconButton(
            onPressed: () {
              getImage();
            },
            icon: Icon(FontAwesomeIcons.fileImage)),
        MaterialButton(
          color: Colors.red.shade300,
          onPressed: _clicked
              ? null
              : () {
                  setState(() {
                    _clicked = true;
                  });
                },
          child: Text(
            "aa",
            style: TextStyle(
              fontFamily: 'Mitr',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        image == null
            ? Center(
                child: Text("select image"),
              )
            : Image.file(image),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                "ออกจากระบบ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mitr'),
              ),
              onPressed: () async => await loginProvider.logout(),
            ),
            IconButton(
                onPressed: () async => await loginProvider.logout(),
                icon: Icon(Icons.exit_to_app)),
          ],
        ),
      ],
    );
  }
}
