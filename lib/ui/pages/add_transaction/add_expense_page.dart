import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../logic/bloc/transaction/expense_bloc.dart';

/// Page to add User's expense transactions
class AddExpensePage extends StatefulWidget {
  // ignore: public_member_api_docs
  const AddExpensePage({Key key}) : super(key: key);
  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  /// Color for all the elements displayed on this page
  static const Color color = Color(0xFFEF9A9A);

  /// Text style for text elements on the page
  static const TextStyle textStyle = TextStyle(color: color);

  /// Underline color for the form elements
  static const UnderlineInputBorder border = UnderlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ExpenseBloc>(context)
      ..timestamp = DateTime.now();

    return Theme(
      data: ThemeData(
        buttonTheme: const ButtonThemeData(buttonColor: color),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: color,
          focusColor: color,
          hintStyle: textStyle,
          labelStyle: textStyle,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
        iconTheme: const IconThemeData(color: color, size: 29),
        cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
              color: color,
              fontSize: 16,
            ),
            pickerTextStyle: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Material(
          child: FormBlocListener<ExpenseBloc, String, String>(
            onSuccess: (context, state) {
              Navigator.of(context).pop();
            },
            onFailure: (context, state) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.failureResponse)));
            },
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  // Amount
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.amount,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixIcon: Icon(
                          Icons.monetization_on,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  // From account
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.fromAccount,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'From account',
                        prefixIcon: Icon(
                          Icons.account_balance_wallet,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  // Category
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.category,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        prefixIcon: Icon(
                          Icons.category,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  // Sub category
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.subCategory,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Sub category',
                        prefixIcon: Icon(
                          Icons.change_history,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  // Description
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.description,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        prefixIcon: Icon(
                          Icons.description,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Date text
                  const Text('Date', style: TextStyle(color: color)),
                  const SizedBox(height: 10),
                  // Date picker
                  SizedBox(
                    height: 80,
                    width: 300,
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.transparent,
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: bloc.timestamp,
                      onDateTimeChanged: (datetime) {
                        bloc.timestamp = datetime;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Submit button
                  RaisedButton(
                    onPressed: bloc.submit,
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
