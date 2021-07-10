<<<<<<< HEAD

=======
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:sevr/sevr.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void start() async {
  await Parse().initialize('hello', 'http://localhost:1338/parse');
}
// void start() async {
//   final db = await Db.create(
//       'mongodb+srv://arm:1234@cluster0.3mhnx.mongodb.net/nicky?retryWrites=true&w=majority');
//   await db.open();
//   final coll = db.collection('pet');

//   const port = 8081;
//   final serv = Sevr();

//   serv.get('/', [
//     (ServRequest req, ServResponse res) async {
//       final pet = await coll.find().toList();
//       return res.status(200).json({'pet': pet});
//     }
//   ]);

//   serv.post('/', [
//     (ServRequest req, ServResponse res) async {
//       await coll.save(req.body);
//       return res.json(await coll.findOne(where.eq('name', req.body['name'])));
//     }
//   ]);

//   serv.listen(port, callback: () {
//     print('Server Listening on port: $port');
//   });
// }
>>>>>>> parent of ead7177 (login page)
