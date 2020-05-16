import 'package:moor/moor.dart';

import '../database.dart';

part 'transactions.g.dart';

class Transaction {
  Transaction({this.type, this.income, this.expense, this.transfer});

  final String type;
  final Income income;
  final Expense expense;
  final Transfer transfer;

  DateTime get timestamp =>
      income?.timestamp ?? expense?.timestamp ?? transfer?.timestamp;

  @override
  String toString() {
    return 'Transaction(type: $type, timestamp: $timestamp)';
  }
}

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

  Stream<List<Income>> watchIncomes() => select(incomes).watch();

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

  Stream<List<Expense>> watchExpenses() => select(expenses).watch();

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

  Stream<List<Transfer>> watchTransfers() => select(transfers).watch();

  /// Get List of all transactions
  Future<List<Transaction>> getTranscations() async {
    final incomeList = await getIncomes();
    final expenseList = await getExpenses();
    final transferList = await getTransfers();

    final list = <Transaction>[
      ...incomeList.map((e) => Transaction(type: 'income', income: e)),
      ...expenseList.map((e) => Transaction(type: 'expense', expense: e)),
      ...transferList.map((e) => Transaction(type: 'transfer', transfer: e)),
    ]..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return list;
  }

  // Stream<List<Transaction>> watchTranscations() async* {
  //   final incomeList = await getIncomes();
  //   final expenseList = await getExpenses();
  //   final transferList = await getTransfers();

  //   final list = <Transaction>[
  //     ...incomeList.map((e) => Transaction(type: 'income', income: e)),
  //     ...expenseList.map((e) => Transaction(type: 'income', expense: e)),
  //     ...transferList.map((e) => Transaction(type: 'income', transfer: e)),
  //   ]..sort((a, b) => a.timestamp.compareTo(b.timestamp));
  //   yield list;
  // }

  Stream<void> watchTranscations() async* {
    yield TableUpdateQuery.allOf([
      TableUpdateQuery.onTable(incomes),
      TableUpdateQuery.onTable(expenses),
      TableUpdateQuery.onTable(transfers),
    ]);
  }
}
