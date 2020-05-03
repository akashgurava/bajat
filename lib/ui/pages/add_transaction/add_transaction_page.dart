import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'add_expense_page.dart';
import 'add_income_page.dart';
import 'add_transfer_page.dart';

/// Page to add User's transfer transactions
class AddTransactionPage extends StatefulWidget {
  // ignore: public_member_api_docs
  const AddTransactionPage({Key key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final Map<String, Widget> segmentedTabs = {
    'income': const Text('Income'),
    'expense': const Text('Expense'),
    'transfer': const Text('Transfer'),
  };

  final Map<String, Widget> tabChildren = {
    'income': const AddIncomePage(),
    'expense': const AddExpensePage(),
    'transfer': const AddTransferPage(),
  };

  /// The selected index from Top Tab bar for filtering dashboard
  String selectedIndex = 'expense';

  Color get barBackgroundColor {
    switch (selectedIndex) {
      case 'income':
        return Colors.green[300];
      case 'expense':
        return Colors.red[300];
      case 'transfer':
        return Colors.blue[300];
      default:
        return Colors.black;
    }
  }

  Color get segmentBackgroundColor {
    switch (selectedIndex) {
      case 'income':
        return Colors.green[600];
      case 'expense':
        return Colors.red[600];
      case 'transfer':
        return Colors.blue[600];
      default:
        return Colors.black;
    }
  }

  Color get thumbColor {
    switch (selectedIndex) {
      case 'income':
        return Colors.green[100];
      case 'expense':
        return Colors.red[100];
      case 'transfer':
        return Colors.blue[100];
      default:
        return Colors.black;
    }
  }

  Color get childBackgroundColor {
    switch (selectedIndex) {
      case 'income':
        return Colors.green[50];
      case 'expense':
        return Colors.red[50];
      case 'transfer':
        return Colors.blue[50];
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: barBackgroundColor,
        automaticallyImplyLeading: false,
        middle: CupertinoSlidingSegmentedControl(
          thumbColor: thumbColor,
          backgroundColor: segmentBackgroundColor,
          // ignore: avoid_types_on_closure_parameters
          onValueChanged: (String value) {
            setState(() {
              selectedIndex = value;
            });
          },
          groupValue: selectedIndex,
          children: segmentedTabs,
        ),
      ),
      child: CupertinoScaffold(
        body: Container(
          color: childBackgroundColor,
          child: SizedBox.expand(
            child: tabChildren[selectedIndex],
          ),
        ),
      ),
    );
  }
}
