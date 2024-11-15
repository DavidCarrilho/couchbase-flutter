import 'package:cbl/cbl.dart';

class CouchbaseService {
  AsyncDatabase? database;

  Future<void> init() async {
    database ??= await Database.openAsync('database');
  }

  Future<bool> add({
    required Map<String, dynamic> data,
    required String collectionName,
  }) async {
    final collection = await database?.createCollection(collectionName);
    if (collection != null) {
      final document = MutableDocument(data);
      return await collection.saveDocument(document);
    }
    return false;
  }
}
