import 'package:flutter/material.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  static const routeName = '/setting';

  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Log Out นะจ๊ะ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        actions: [
          IconButton(
              onPressed: () async => await loginProvider.logout(),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}
