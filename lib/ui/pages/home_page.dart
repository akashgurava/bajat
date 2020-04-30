import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'transaction_page.dart';

/// Homepage for the app.
class HomePage extends StatelessWidget {
  // ignore: public_member_api_docs
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Hello World! Welcome to Bajat!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet<Widget>(
            context: context,
            builder: (context, scrollController) => const TransactionPage(),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const SizedBox(
        height: 50,
      ),
    );
  }
}
