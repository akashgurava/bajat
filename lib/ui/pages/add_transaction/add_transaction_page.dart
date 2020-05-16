import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../logic/bloc/transaction/expense_bloc.dart';
import '../../../logic/bloc/transaction/income_bloc.dart';
import '../../../logic/bloc/transaction/transfer_bloc.dart';

import 'add_expense_page.dart';
import 'add_income_page.dart';
import 'add_transfer_page.dart';

/// Scaffold Page to hold add any kind of transaction.
class AddTransactionPage extends StatefulWidget {
  // ignore: public_member_api_docs
  const AddTransactionPage({Key key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  /// Widgets for segements in tab control
  final Map<String, Widget> segmentedTabs = {
    'income': const Text('Income'),
    'expense': const Text('Expense'),
    'transfer': const Text('Transfer'),
  };

  /// Corresponding child Widgets for selected segement
  final Map<String, Widget> tabChildren = {
    'income': const AddIncomePage(),
    'expense': const AddExpensePage(),
    'transfer': const AddTransferPage(),
  };

  /// The selected index from Top Tab bar for filtering dashboard
  String selectedIndex = 'expense';

  /// background color for the top bar
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

  /// background color for segement control
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

  /// Color for selected element in the segement control
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

  /// Color forbody of the scaffold
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<IncomeBloc>(
          create: (context) => IncomeBloc(),
        ),
        BlocProvider<ExpenseBloc>(
          create: (context) => ExpenseBloc(),
        ),
        BlocProvider<TransferBloc>(
          create: (context) => TransferBloc(),
        ),
      ],
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: barBackgroundColor,
          // TODO: should we show the back button?
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
      ),
    );
  }
}
