import 'package:flutter/material.dart';

import '../../logic/db/database.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard(this.income, {Key key}) : super(key: key);

  final Income income;

  @override
  Widget build(BuildContext context) {
    final timestamp = income.timestamp;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: SizedBox(
        height: 75,
        child: Card(
          color: Colors.green[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      income.source,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      income.amount.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.green[700]),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      income.account,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${timestamp.day}-${timestamp.month}-${timestamp.year}',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(this.expense, {Key key}) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final timestamp = expense.timestamp;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: SizedBox(
        height: 75,
        child: Card(
          color: Colors.red[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      expense.category,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      expense.amount.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.red[700]),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      expense.account,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${timestamp.day}-${timestamp.month}-${timestamp.year}',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransferCard extends StatelessWidget {
  const TransferCard(this.transfer, {Key key}) : super(key: key);

  final Transfer transfer;

  @override
  Widget build(BuildContext context) {
    final timestamp = transfer.timestamp;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: SizedBox(
        height: 75,
        child: Card(
          color: Colors.blue[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      transfer.toAccount,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      transfer.amount.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.blue[700]),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      transfer.fromAccount,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${timestamp.day}-${timestamp.month}-${timestamp.year}',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
