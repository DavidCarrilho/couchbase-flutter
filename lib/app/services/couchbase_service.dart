import 'package:cbl/cbl.dart';

class CouchbaseService {
  AsyncDatabase? database;

  Future<void> init() async {
    database ??= await Database.openAsync('database');
  }
}
