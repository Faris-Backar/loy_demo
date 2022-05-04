import 'package:moor_flutter/moor_flutter.dart';
part 'db.g.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get soldBy => text()();
  TextColumn get barCode => text()();
  IntColumn get price => integer()();
  IntColumn get sku => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Items])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
              path: "db.sqlite", logStatements: true),
        );
  @override
  int get schemaVersion => 1;
  Future<List<Item>> getAllItem() => select(items).get();
  Stream<List<Item>> watchAllItem() => select(items).watch();
  Future insertNewItem(Item item) => into(items).insert(item);
  Future deleteItem(Item item) => delete(items).delete(item);
}
