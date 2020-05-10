// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Income extends DataClass implements Insertable<Income> {
  final int id;
  final double amount;
  final String source;
  final String account;
  final String note;
  final DateTime timestamp;
  Income(
      {@required this.id,
      @required this.amount,
      @required this.source,
      @required this.account,
      this.note,
      @required this.timestamp});
  factory Income.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Income(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      source:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}source']),
      account:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}account']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || account != null) {
      map['account'] = Variable<String>(account);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    return map;
  }

  factory Income.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Income(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      source: serializer.fromJson<String>(json['source']),
      account: serializer.fromJson<String>(json['account']),
      note: serializer.fromJson<String>(json['note']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'source': serializer.toJson<String>(source),
      'account': serializer.toJson<String>(account),
      'note': serializer.toJson<String>(note),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Income copyWith(
          {int id,
          double amount,
          String source,
          String account,
          String note,
          DateTime timestamp}) =>
      Income(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        source: source ?? this.source,
        account: account ?? this.account,
        note: note ?? this.note,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Income(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('source: $source, ')
          ..write('account: $account, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          amount.hashCode,
          $mrjc(
              source.hashCode,
              $mrjc(account.hashCode,
                  $mrjc(note.hashCode, timestamp.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Income &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.source == this.source &&
          other.account == this.account &&
          other.note == this.note &&
          other.timestamp == this.timestamp);
}

class IncomesCompanion extends UpdateCompanion<Income> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> source;
  final Value<String> account;
  final Value<String> note;
  final Value<DateTime> timestamp;
  const IncomesCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.source = const Value.absent(),
    this.account = const Value.absent(),
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  IncomesCompanion.insert({
    this.id = const Value.absent(),
    @required double amount,
    @required String source,
    @required String account,
    this.note = const Value.absent(),
    @required DateTime timestamp,
  })  : amount = Value(amount),
        source = Value(source),
        account = Value(account),
        timestamp = Value(timestamp);
  static Insertable<Income> custom({
    Expression<int> id,
    Expression<double> amount,
    Expression<String> source,
    Expression<String> account,
    Expression<String> note,
    Expression<DateTime> timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (source != null) 'source': source,
      if (account != null) 'account': account,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  IncomesCompanion copyWith(
      {Value<int> id,
      Value<double> amount,
      Value<String> source,
      Value<String> account,
      Value<String> note,
      Value<DateTime> timestamp}) {
    return IncomesCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      source: source ?? this.source,
      account: account ?? this.account,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (account.present) {
      map['account'] = Variable<String>(account.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }
}

class $IncomesTable extends Incomes with TableInfo<$IncomesTable, Income> {
  final GeneratedDatabase _db;
  final String _alias;
  $IncomesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  GeneratedTextColumn _source;
  @override
  GeneratedTextColumn get source => _source ??= _constructSource();
  GeneratedTextColumn _constructSource() {
    return GeneratedTextColumn(
      'source',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  GeneratedTextColumn _account;
  @override
  GeneratedTextColumn get account => _account ??= _constructAccount();
  GeneratedTextColumn _constructAccount() {
    return GeneratedTextColumn(
      'account',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, source, account, note, timestamp];
  @override
  $IncomesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'incomes';
  @override
  final String actualTableName = 'incomes';
  @override
  VerificationContext validateIntegrity(Insertable<Income> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source'], _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account'], _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Income map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Income.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $IncomesTable createAlias(String alias) {
    return $IncomesTable(_db, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final double amount;
  final String account;
  final String category;
  final String subCategory;
  final String note;
  final DateTime timestamp;
  Expense(
      {@required this.id,
      @required this.amount,
      @required this.account,
      @required this.category,
      @required this.subCategory,
      this.note,
      @required this.timestamp});
  factory Expense.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Expense(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      account:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}account']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      subCategory: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_category']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || account != null) {
      map['account'] = Variable<String>(account);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || subCategory != null) {
      map['sub_category'] = Variable<String>(subCategory);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    return map;
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      account: serializer.fromJson<String>(json['account']),
      category: serializer.fromJson<String>(json['category']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      note: serializer.fromJson<String>(json['note']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'account': serializer.toJson<String>(account),
      'category': serializer.toJson<String>(category),
      'subCategory': serializer.toJson<String>(subCategory),
      'note': serializer.toJson<String>(note),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Expense copyWith(
          {int id,
          double amount,
          String account,
          String category,
          String subCategory,
          String note,
          DateTime timestamp}) =>
      Expense(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        account: account ?? this.account,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        note: note ?? this.note,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('account: $account, ')
          ..write('category: $category, ')
          ..write('subCategory: $subCategory, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          amount.hashCode,
          $mrjc(
              account.hashCode,
              $mrjc(
                  category.hashCode,
                  $mrjc(subCategory.hashCode,
                      $mrjc(note.hashCode, timestamp.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.account == this.account &&
          other.category == this.category &&
          other.subCategory == this.subCategory &&
          other.note == this.note &&
          other.timestamp == this.timestamp);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> account;
  final Value<String> category;
  final Value<String> subCategory;
  final Value<String> note;
  final Value<DateTime> timestamp;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.account = const Value.absent(),
    this.category = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    @required double amount,
    @required String account,
    @required String category,
    @required String subCategory,
    this.note = const Value.absent(),
    @required DateTime timestamp,
  })  : amount = Value(amount),
        account = Value(account),
        category = Value(category),
        subCategory = Value(subCategory),
        timestamp = Value(timestamp);
  static Insertable<Expense> custom({
    Expression<int> id,
    Expression<double> amount,
    Expression<String> account,
    Expression<String> category,
    Expression<String> subCategory,
    Expression<String> note,
    Expression<DateTime> timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (account != null) 'account': account,
      if (category != null) 'category': category,
      if (subCategory != null) 'sub_category': subCategory,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int> id,
      Value<double> amount,
      Value<String> account,
      Value<String> category,
      Value<String> subCategory,
      Value<String> note,
      Value<DateTime> timestamp}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      account: account ?? this.account,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (account.present) {
      map['account'] = Variable<String>(account.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<String>(subCategory.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExpensesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  GeneratedTextColumn _account;
  @override
  GeneratedTextColumn get account => _account ??= _constructAccount();
  GeneratedTextColumn _constructAccount() {
    return GeneratedTextColumn(
      'account',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  GeneratedTextColumn _subCategory;
  @override
  GeneratedTextColumn get subCategory =>
      _subCategory ??= _constructSubCategory();
  GeneratedTextColumn _constructSubCategory() {
    return GeneratedTextColumn(
      'sub_category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, account, category, subCategory, note, timestamp];
  @override
  $ExpensesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'expenses';
  @override
  final String actualTableName = 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account'], _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category'], _subCategoryMeta));
    } else if (isInserting) {
      context.missing(_subCategoryMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Expense.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(_db, alias);
  }
}

class Transfer extends DataClass implements Insertable<Transfer> {
  final int id;
  final double amount;
  final String fromAccount;
  final String toAccount;
  final String note;
  final DateTime timestamp;
  Transfer(
      {@required this.id,
      @required this.amount,
      @required this.fromAccount,
      @required this.toAccount,
      this.note,
      @required this.timestamp});
  factory Transfer.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Transfer(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      fromAccount: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}from_account']),
      toAccount: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}to_account']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || fromAccount != null) {
      map['from_account'] = Variable<String>(fromAccount);
    }
    if (!nullToAbsent || toAccount != null) {
      map['to_account'] = Variable<String>(toAccount);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    return map;
  }

  factory Transfer.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transfer(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      fromAccount: serializer.fromJson<String>(json['fromAccount']),
      toAccount: serializer.fromJson<String>(json['toAccount']),
      note: serializer.fromJson<String>(json['note']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'fromAccount': serializer.toJson<String>(fromAccount),
      'toAccount': serializer.toJson<String>(toAccount),
      'note': serializer.toJson<String>(note),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Transfer copyWith(
          {int id,
          double amount,
          String fromAccount,
          String toAccount,
          String note,
          DateTime timestamp}) =>
      Transfer(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        fromAccount: fromAccount ?? this.fromAccount,
        toAccount: toAccount ?? this.toAccount,
        note: note ?? this.note,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Transfer(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('fromAccount: $fromAccount, ')
          ..write('toAccount: $toAccount, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          amount.hashCode,
          $mrjc(
              fromAccount.hashCode,
              $mrjc(toAccount.hashCode,
                  $mrjc(note.hashCode, timestamp.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Transfer &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.fromAccount == this.fromAccount &&
          other.toAccount == this.toAccount &&
          other.note == this.note &&
          other.timestamp == this.timestamp);
}

class TransfersCompanion extends UpdateCompanion<Transfer> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> fromAccount;
  final Value<String> toAccount;
  final Value<String> note;
  final Value<DateTime> timestamp;
  const TransfersCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.fromAccount = const Value.absent(),
    this.toAccount = const Value.absent(),
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  TransfersCompanion.insert({
    this.id = const Value.absent(),
    @required double amount,
    @required String fromAccount,
    @required String toAccount,
    this.note = const Value.absent(),
    @required DateTime timestamp,
  })  : amount = Value(amount),
        fromAccount = Value(fromAccount),
        toAccount = Value(toAccount),
        timestamp = Value(timestamp);
  static Insertable<Transfer> custom({
    Expression<int> id,
    Expression<double> amount,
    Expression<String> fromAccount,
    Expression<String> toAccount,
    Expression<String> note,
    Expression<DateTime> timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (fromAccount != null) 'from_account': fromAccount,
      if (toAccount != null) 'to_account': toAccount,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  TransfersCompanion copyWith(
      {Value<int> id,
      Value<double> amount,
      Value<String> fromAccount,
      Value<String> toAccount,
      Value<String> note,
      Value<DateTime> timestamp}) {
    return TransfersCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      fromAccount: fromAccount ?? this.fromAccount,
      toAccount: toAccount ?? this.toAccount,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (fromAccount.present) {
      map['from_account'] = Variable<String>(fromAccount.value);
    }
    if (toAccount.present) {
      map['to_account'] = Variable<String>(toAccount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }
}

class $TransfersTable extends Transfers
    with TableInfo<$TransfersTable, Transfer> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransfersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fromAccountMeta =
      const VerificationMeta('fromAccount');
  GeneratedTextColumn _fromAccount;
  @override
  GeneratedTextColumn get fromAccount =>
      _fromAccount ??= _constructFromAccount();
  GeneratedTextColumn _constructFromAccount() {
    return GeneratedTextColumn(
      'from_account',
      $tableName,
      false,
    );
  }

  final VerificationMeta _toAccountMeta = const VerificationMeta('toAccount');
  GeneratedTextColumn _toAccount;
  @override
  GeneratedTextColumn get toAccount => _toAccount ??= _constructToAccount();
  GeneratedTextColumn _constructToAccount() {
    return GeneratedTextColumn(
      'to_account',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, fromAccount, toAccount, note, timestamp];
  @override
  $TransfersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transfers';
  @override
  final String actualTableName = 'transfers';
  @override
  VerificationContext validateIntegrity(Insertable<Transfer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('from_account')) {
      context.handle(
          _fromAccountMeta,
          fromAccount.isAcceptableOrUnknown(
              data['from_account'], _fromAccountMeta));
    } else if (isInserting) {
      context.missing(_fromAccountMeta);
    }
    if (data.containsKey('to_account')) {
      context.handle(_toAccountMeta,
          toAccount.isAcceptableOrUnknown(data['to_account'], _toAccountMeta));
    } else if (isInserting) {
      context.missing(_toAccountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transfer map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Transfer.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TransfersTable createAlias(String alias) {
    return $TransfersTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $IncomesTable _incomes;
  $IncomesTable get incomes => _incomes ??= $IncomesTable(this);
  $ExpensesTable _expenses;
  $ExpensesTable get expenses => _expenses ??= $ExpensesTable(this);
  $TransfersTable _transfers;
  $TransfersTable get transfers => _transfers ??= $TransfersTable(this);
  TransactionsDao _transactionsDao;
  TransactionsDao get transactionsDao =>
      _transactionsDao ??= TransactionsDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [incomes, expenses, transfers];
}
