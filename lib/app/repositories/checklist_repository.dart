import 'package:checklist/app/entities/shopping_item_entity.dart';

import '../services/couchbase_service.dart';

class ChecklistRepository {
  final CouchbaseService couchbaseService;

  ChecklistRepository({required this.couchbaseService});

  final List<ShoppingItemEntity> _items = [];

  final collectionName = 'checklist';

  Future<List<ShoppingItemEntity>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List<ShoppingItemEntity>.from(_items);
  }

  Future<void> addItem(ShoppingItemEntity item) async {
    await couchbaseService.add(
      data: item.toMap(),
      collectionName: collectionName,
    );
    print('item salvo');
  }

  Future<ShoppingItemEntity> updateItem({
    required int id,
    String? title,
    bool? isCompleted,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        title: title,
        isCompleted: isCompleted,
      );

      return _items[index];
    } else {
      throw Exception();
    }
  }

  Future<void> deleteItem(int id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _items.removeWhere((item) => item.id == id);
  }
}
