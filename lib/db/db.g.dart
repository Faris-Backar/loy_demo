// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Item extends DataClass implements Insertable<Item> {
  final int id;
  final String name;
  final String category;
  final String soldBy;
  final String barCode;
  final int price;
  final int sku;
  Item(
      {required this.id,
      required this.name,
      required this.category,
      required this.soldBy,
      required this.barCode,
      required this.price,
      required this.sku});
  factory Item.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Item(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      soldBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sold_by'])!,
      barCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bar_code'])!,
      price: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      sku: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sku'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['sold_by'] = Variable<String>(soldBy);
    map['bar_code'] = Variable<String>(barCode);
    map['price'] = Variable<int>(price);
    map['sku'] = Variable<int>(sku);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      soldBy: Value(soldBy),
      barCode: Value(barCode),
      price: Value(price),
      sku: Value(sku),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      soldBy: serializer.fromJson<String>(json['soldBy']),
      barCode: serializer.fromJson<String>(json['barCode']),
      price: serializer.fromJson<int>(json['price']),
      sku: serializer.fromJson<int>(json['sku']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'soldBy': serializer.toJson<String>(soldBy),
      'barCode': serializer.toJson<String>(barCode),
      'price': serializer.toJson<int>(price),
      'sku': serializer.toJson<int>(sku),
    };
  }

  Item copyWith(
          {int? id,
          String? name,
          String? category,
          String? soldBy,
          String? barCode,
          int? price,
          int? sku}) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        soldBy: soldBy ?? this.soldBy,
        barCode: barCode ?? this.barCode,
        price: price ?? this.price,
        sku: sku ?? this.sku,
      );
  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('soldBy: $soldBy, ')
          ..write('barCode: $barCode, ')
          ..write('price: $price, ')
          ..write('sku: $sku')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, category, soldBy, barCode, price, sku);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.soldBy == this.soldBy &&
          other.barCode == this.barCode &&
          other.price == this.price &&
          other.sku == this.sku);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> soldBy;
  final Value<String> barCode;
  final Value<int> price;
  final Value<int> sku;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.soldBy = const Value.absent(),
    this.barCode = const Value.absent(),
    this.price = const Value.absent(),
    this.sku = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    required String soldBy,
    required String barCode,
    required int price,
    required int sku,
  })  : name = Value(name),
        category = Value(category),
        soldBy = Value(soldBy),
        barCode = Value(barCode),
        price = Value(price),
        sku = Value(sku);
  static Insertable<Item> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? soldBy,
    Expression<String>? barCode,
    Expression<int>? price,
    Expression<int>? sku,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (soldBy != null) 'sold_by': soldBy,
      if (barCode != null) 'bar_code': barCode,
      if (price != null) 'price': price,
      if (sku != null) 'sku': sku,
    });
  }

  ItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? category,
      Value<String>? soldBy,
      Value<String>? barCode,
      Value<int>? price,
      Value<int>? sku}) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      soldBy: soldBy ?? this.soldBy,
      barCode: barCode ?? this.barCode,
      price: price ?? this.price,
      sku: sku ?? this.sku,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (soldBy.present) {
      map['sold_by'] = Variable<String>(soldBy.value);
    }
    if (barCode.present) {
      map['bar_code'] = Variable<String>(barCode.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (sku.present) {
      map['sku'] = Variable<int>(sku.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('soldBy: $soldBy, ')
          ..write('barCode: $barCode, ')
          ..write('price: $price, ')
          ..write('sku: $sku')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _soldByMeta = const VerificationMeta('soldBy');
  @override
  late final GeneratedColumn<String?> soldBy = GeneratedColumn<String?>(
      'sold_by', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _barCodeMeta = const VerificationMeta('barCode');
  @override
  late final GeneratedColumn<String?> barCode = GeneratedColumn<String?>(
      'bar_code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int?> price = GeneratedColumn<int?>(
      'price', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<int?> sku = GeneratedColumn<int?>(
      'sku', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, category, soldBy, barCode, price, sku];
  @override
  String get aliasedName => _alias ?? 'items';
  @override
  String get actualTableName => 'items';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sold_by')) {
      context.handle(_soldByMeta,
          soldBy.isAcceptableOrUnknown(data['sold_by']!, _soldByMeta));
    } else if (isInserting) {
      context.missing(_soldByMeta);
    }
    if (data.containsKey('bar_code')) {
      context.handle(_barCodeMeta,
          barCode.isAcceptableOrUnknown(data['bar_code']!, _barCodeMeta));
    } else if (isInserting) {
      context.missing(_barCodeMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Item.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ItemsTable items = $ItemsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [items];
}
