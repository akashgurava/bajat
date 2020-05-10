import 'package:moor/moor.dart';

import '../database.dart';

part 'transactions.g.dart';

/// Income table to represent income transactions in DB
class Incomes extends Table {
  /// Auto increementing primary key
  IntColumn get id => integer().autoIncrement()();

  /// Transaction amount
  RealColumn get amount => real()();

  /// Source of income
  TextColumn get source => text()();

  /// Account to which the income is credited
  TextColumn get account => text()();

  /// Optional note for transaction
  TextColumn get note => text().nullable()();

  /// Timestamp of transaction
  DateTimeColumn get timestamp => dateTime()();
}

/// Expense table to represent expense transactions in DB
class Expenses extends Table {
  /// Auto increementing primary key
  IntColumn get id => integer().autoIncrement()();

  /// Transaction amount
  RealColumn get amount => real()();

  /// Account from which transaction is made
  TextColumn get account => text()();

  /// Category of transaction
  TextColumn get category => text()();

  /// Sub category of transaction
  TextColumn get subCategory => text()();

  /// Optional note for transaction
  TextColumn get note => text().nullable()();

  /// Timestamp of transaction
  DateTimeColumn get timestamp => dateTime()();
}

/// Transfer table to represent transfer transactions in DB
class Transfers extends Table {
  /// Auto increementing primary key
  IntColumn get id => integer().autoIncrement()();

  /// Transaction amount
  RealColumn get amount => real()();

  /// Account from which transfer is made
  TextColumn get fromAccount => text()();

  /// Account to which transfer is made
  TextColumn get toAccount => text()();

  /// Optional note for transaction
  TextColumn get note => text().nullable()();

  /// Timestamp of transaction
  DateTimeColumn get timestamp => dateTime()();
}

/// Common DB actions related to transactions
@UseDao(tables: [Incomes, Expenses, Transfers])
class TransactionsDao extends DatabaseAccessor<Database>
    with _$TransactionsDaoMixin {
  // ignore: public_member_api_docs
  TransactionsDao(Database db) : super(db);

  /// Insert income to DB.
  ///
  /// Example:
  /// ```
  /// insertIncome(IncomeCompanion(
  ///   amount: Value(25000),
  ///   source: Value('salary'),
  ///   account: Value('ICICI'),
  ///   note: Value('April salary'),
  ///   timestamp: DateTime.now(),
  /// ));
  /// ```
  Future<void> insertIncome(IncomesCompanion income) =>
      into(incomes).insert(income);

  /// Get List of all incomes
  Future<List<Income>> getIncomes() => select(incomes).get();

  /// Insert expense to DB.
  ///
  /// Example:
  /// ```
  /// insertExpense(ExpenseCompanion(
  ///   amount: Value(1200),
  ///   account: Value('ICICI'),
  ///   category: Value('Shopping')
  ///   subCategory: Value('Clothes')
  ///   note: Value('new clothes for birthday'),
  ///   timestamp: DateTime.now(),
  /// ));
  /// ```
  Future<void> insertExpense(ExpensesCompanion expense) =>
      into(expenses).insert(expense);

  /// Get List of all expenses
  Future<List<Expense>> getExpenses() => select(expenses).get();

  /// Insert transfer to DB.
  ///
  /// Example:
  /// ```
  /// insertExpense(ExpenseCompanion(
  ///   amount: Value(1200),
  ///   fromAccount: Value('ICICI'),
  ///   toAccount: Value('Citi Credit card'),
  ///   note: Value('Bill payment for march month'),
  ///   timestamp: DateTime.now(),
  /// ));
  /// ```
  Future<void> insertTransfer(TransfersCompanion transfer) =>
      into(transfers).insert(transfer);

  /// Get List of all transfers
  Future<List<Transfer>> getTransfers() => select(transfers).get();

  /// Get List of all transactions
  Future<List> getTranscations() async {
    final list = <dynamic>[
      ...await getIncomes(),
      ...await getExpenses(),
      ...await getTransfers()
      // ignore: avoid_annotating_with_dynamic
    ]..sort((dynamic a, dynamic b) =>
        int.tryParse(a.timestamp.compareTo(b.timestamp).toString()));
    return list;
  }
}
