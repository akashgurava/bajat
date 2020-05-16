import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:path/path.dart' show join;

import 'schema/transactions.dart';

part 'database.g.dart';

/// Database connector with SQLite DB
@UseMoor(tables: [Incomes, Expenses, Transfers], daos: [TransactionsDao])
class Database extends _$Database {
  // ignore: public_member_api_docs
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (migrator) async {
        await customStatement('PRAGMA foreign_keys = ON');
        await migrator.createAll();
      },
      // Runs after all the migrations but BEFORE any
      //queries have a chance to execute
      beforeOpen: (db) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

/// Contruct DB instance
Database constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await getApplicationDocumentsDirectory();
      final dbFile = File(join(dataDir.path, 'db.sqlite'));
      dbFile.deleteSync();

      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return Database(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    return Database(VmDatabase(file, logStatements: logStatements));
  }
  if (Platform.isWindows) {
    final file = File('db.sqlite');
    return Database(VmDatabase(file, logStatements: logStatements));
  }
  return Database(VmDatabase.memory(logStatements: logStatements));
}
