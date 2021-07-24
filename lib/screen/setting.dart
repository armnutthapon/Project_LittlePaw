import 'package:flutter/material.dart';
import 'package:little_paw/screen/mypet.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
// import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
import 'package:little_paw/server.dart' as server;

void main(List<String> arguments) {
  server.start();
}

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
      body: Test(),
      appBar: AppBar(
        title: Text("Homepage"),
        actions: [
          IconButton(
              onPressed: () async => await loginProvider.logout(),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => MyPet()));
            },
            child: const Text('Disabled'),
          ),
        ],
      ),
    );
  }
}
