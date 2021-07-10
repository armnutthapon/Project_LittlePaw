import 'package:flutter/material.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
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
