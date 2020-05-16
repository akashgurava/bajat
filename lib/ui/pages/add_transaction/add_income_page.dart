import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../logic/bloc/transaction/income_bloc.dart';

/// Page to add User's income transactions
class AddIncomePage extends StatefulWidget {
  // ignore: public_member_api_docs
  const AddIncomePage({Key key}) : super(key: key);

  @override
  _AddIncomePageState createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  /// Color for all the elements displayed on this page
  static const Color color = Colors.green;

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
    final bloc = BlocProvider.of<IncomeBloc>(context)
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
          child: FormBlocListener<IncomeBloc, String, String>(
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
                  // Source
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.source,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Source',
                        prefixIcon: Icon(
                          Icons.call_received,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  // To account
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.account,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'To account',
                        prefixIcon: Icon(
                          Icons.account_balance,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  // Note
                  SizedBox(
                    width: 250,
                    child: TextFieldBlocBuilder(
                      style: textStyle,
                      textFieldBloc: bloc.note,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Note',
                        prefixIcon: Icon(
                          Icons.description,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Date text
                  const Text('Date', style: textStyle),
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
