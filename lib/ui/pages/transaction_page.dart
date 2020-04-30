import 'package:flutter/material.dart';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../logic/bloc/transaction_bloc.dart';

/// Page to enter transaction details.
class TransactionPage extends StatelessWidget {
  // ignore: public_member_api_docs
  const TransactionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionBloc>(
      create: (context) => TransactionBloc(),
      child: Builder(
        builder: (context) {
          final transactionBloc = context.bloc<TransactionBloc>();

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: const Text('Enter Transaction Details')),
            body: FormBlocListener<TransactionBloc, String, String>(
              onSubmitting: (context, state) {
                LoadingDialog.show(context);
              },
              onSuccess: (context, state) {
                LoadingDialog.hide(context);

                Navigator.of(context).pop();
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);

                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text(state.failureResponse)));
              },
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    TextFieldBlocBuilder(
                      textFieldBloc: transactionBloc.type,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Type',
                      ),
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: transactionBloc.amount,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Transaction Amount',
                        prefixIcon: Icon(Icons.monetization_on),
                      ),
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: transactionBloc.fromAccount,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'From account',
                        prefixIcon: Icon(Icons.account_balance_wallet),
                      ),
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: transactionBloc.toAccount,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'To account',
                        prefixIcon: Icon(Icons.call_made),
                      ),
                    ),
                    DateTimeFieldBlocBuilder(
                      dateTimeFieldBloc: transactionBloc.timestamp,
                      format: DateFormat('dd-MM-yyyy'),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      decoration: const InputDecoration(
                        labelText: 'Time of transaction',
                        prefixIcon: Icon(Icons.calendar_today),
                        helperText: 'Date',
                      ),
                    ),
                    RaisedButton(
                      onPressed: transactionBloc.submit,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Loading dialog to show when Transaction page is processing
class LoadingDialog extends StatelessWidget {
  // ignore: public_member_api_docs
  const LoadingDialog({Key key}) : super(key: key);

  /// Show the dialog
  static void show(BuildContext context, {Key key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  /// Hide the dialog
  static void hide(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
