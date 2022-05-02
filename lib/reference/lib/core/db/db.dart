import 'package:moor_flutter/moor_flutter.dart';
part 'db.g.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text()();
  TextColumn get userName => text()();
  IntColumn get age => integer()();
  // @override
  // Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Items])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;
  Future<List<Item>> getAllItem() => select(items).get();
  Stream<List<Item>> watchAllItem() => select(items).watch();
  Future insertNewItem(Item itemss) => into(items).insert(itemss);
  Future deleteItem(Item itemss) => delete(items).delete(itemss);
}
