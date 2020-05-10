import 'package:get_it/get_it.dart';

import '../logic/db/database.dart';

/// GetIt locator
GetIt locator = GetIt.instance;

/// Setup locator with required Objects
void setupLocator() {
  /// Init DB
  final db = constructDb();
  locator.registerSingleton<Database>(db);
}
