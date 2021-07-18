import 'package:flutter/material.dart';

class Newfeed extends StatelessWidget {
  const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: mediaQuery.size.height / 4,
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80))),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: mediaQuery.size.height,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(80))),
                  child: Center(child: Text('data')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
