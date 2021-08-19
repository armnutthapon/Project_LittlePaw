import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class Newfeed extends StatelessWidget {
  // const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "ข่าว นะจ๊ะ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        backgroundColor: Colors.green.withOpacity(1),
        elevation: 10.0,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              getImage();
            },
            icon: Icon(FontAwesomeIcons.fileImage)),
        image == null
            ? Center(
                child: Text("select image"),
              )
            : Image.file(image)
      ],
    );
  }
}
