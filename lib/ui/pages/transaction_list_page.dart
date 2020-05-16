import 'package:flutter/material.dart';

import '../../config/locator.dart';
import '../../logic/db/database.dart';
import '../../logic/db/schema/transactions.dart';
import '../widgets/transaction_widgets.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = locator.get<Database>();
    return StreamBuilder(
      stream: db.transactionsDao.watchTranscations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: db.transactionsDao.getTranscations(),
              // ignore: avoid_types_on_closure_parameters
              builder: (context, AsyncSnapshot<List<Transaction>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      switch (snapshot.data[index].type) {
                        case 'income':
                          final income = snapshot.data[index].income;
                          return IncomeCard(income);
                        case 'expense':
                          final expense = snapshot.data[index].expense;
                          return ExpenseCard(expense);
                        case 'transfer':
                          final transfer = snapshot.data[index].transfer;
                          return TransferCard(transfer);
                        default:
                          return const Text('Yellow');
                      }
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            );
          } else {
            return Text('Error: ${snapshot.error}');
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
