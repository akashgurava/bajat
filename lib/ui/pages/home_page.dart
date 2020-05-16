import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import './add_transaction/add_transaction_page.dart';

import 'transaction_list_page.dart';

/// Homepage for the app.
class HomePage extends StatelessWidget {
  // ignore: public_member_api_docs
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: TransactionListPage()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet<Widget>(
            expand: true,
            context: context,
            builder: (context, scrollController) => const AddTransactionPage(),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const SizedBox(height: 50),
    );
  }
}
