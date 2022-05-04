import 'dart:convert';

class Item {
  int? id;
  String name;
  String category;
  String soldBy;
  double price;
  int sku;
  String barcode;
  Item({
    this.id,
    required this.name,
    required this.category,
    required this.soldBy,
    required this.price,
    required this.sku,
    required this.barcode,
  });

  // static Item fromMap(Map<String, Object?> map) {
  //   final id = map['id'] as int;
  //   final name = map['name'] as String;
  //   final category = map['category'] as String;
  //   final soldBy = map['soldBy'] as String;
  //   final price = map['price'] as double;
  //   final sku = map['sku'] as int;
  //   final barcode = map['barcode'] as String;

  //   return Item(
  //     id: id,
  //     name: name,
  //     category: category,
  //     soldBy: soldBy,
  //     price: price,
  //     sku: sku,
  //     barcode: barcode,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'soldBy': soldBy,
      'price': price,
      'sku': sku,
      'barcode': barcode,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      soldBy: map['soldBy'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      sku: map['sku']?.toInt() ?? 0,
      barcode: map['barcode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
