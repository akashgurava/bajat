/// Data model for user transactions
class Transaction {
  // ignore: public_member_api_docs
  Transaction({
    this.id,
    this.type,
    this.amount,
    this.fromAccount,
    this.toAccount,
    this.timestamp,
    this.description,
  });

  /// Unique ID for transaction
  final String id;

  /// type of transaction
  final String type;

  /// amount of transaction
  final double amount;

  /// Account from which transaction is made
  final String fromAccount;

  /// Account to which transaction is made
  final String toAccount;

  /// time of transaction
  final DateTime timestamp;

  /// optional description
  final String description;

  @override
  String toString() {
    return 'Transaction(type: $type, amount:$amount, time: $timestamp)';
  }
}

/// Income type of transaction
class Income extends Transaction {
  // ignore: public_member_api_docs
  Income({
    String id,
    double amount,
    String source,
    String toAccount,
    DateTime timestamp,
    String description,
  }) : super(
          id: id,
          type: 'income',
          amount: amount,
          fromAccount: source,
          toAccount: toAccount,
          timestamp: timestamp,
          description: description,
        );
}

/// Expense type of transaction
class Expense extends Transaction {
  // ignore: public_member_api_docs
  Expense({
    String id,
    double amount,
    String fromAccount,
    String category,
    String subCategory,
    DateTime timestamp,
    String description,
  }) : super(
          id: id,
          type: 'expense',
          amount: amount,
          fromAccount: fromAccount,
          toAccount: '$category $subCategory',
          timestamp: timestamp,
          description: description,
        );
}

/// Transfer type of transaction
class Transfer extends Transaction {
  // ignore: public_member_api_docs
  Transfer({
    String id,
    double amount,
    String fromAccount,
    String toAccount,
    DateTime timestamp,
    String description,
  }) : super(
          id: id,
          type: 'transfer',
          amount: amount,
          fromAccount: fromAccount,
          toAccount: toAccount,
          timestamp: timestamp,
          description: description,
        );
}
