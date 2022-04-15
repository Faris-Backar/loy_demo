import 'package:loyverse_demo/db/models/item.dart';

class Category {
  String name;
  int avatar;
  Item item;
  Category({
    required this.name,
    required this.avatar,
    required this.item,
  });

  static Category fromMap(Map<String, Object?> map) {
    final name = map['name'] as String;
    final avatar = map['avatar'] as int;
    final item = map['item'] as Item;
    return Category(name: name, avatar: avatar, item: item);
  }
}
