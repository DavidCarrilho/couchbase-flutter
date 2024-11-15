class ShoppingItemEntity {
  int? id;
  String title;
  DateTime createdAt;
  bool isCompleted;

  ShoppingItemEntity({
    required this.title,
    this.id,
    required this.createdAt,
    this.isCompleted = false,
  });

  ShoppingItemEntity copyWith({
    int? id,
    String? title,
    DateTime? createdAt,
    bool? isCompleted,
  }) {
    return ShoppingItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}
