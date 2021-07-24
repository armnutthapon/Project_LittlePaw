import 'package:mongo_dart/mongo_dart.dart';

// import 'package:sevr/sevr.dart';
void start() async {
  final db = await Db.create(
      'mongodb+srv://kannika:kk1234@cluster0.mbee4.mongodb.net/myFirstDatabase?retryWrites=true&w=majority');
  await db.open();
  final coll = db.collection('clinic');

  print(await coll.find());
}
