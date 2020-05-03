import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../logic/helpers/form_check.dart';

/// Scaffold Page to hold add any kind of transaction.
class AddTransferPage extends StatefulWidget {
  // ignore: public_member_api_docs
  const AddTransferPage({Key key}) : super(key: key);

  @override
  _AddTransferPageState createState() => _AddTransferPageState();
}

class _AddTransferPageState extends State<AddTransferPage> {
  final _formKey = GlobalKey<FormState>();
  static const Color color = Colors.blue;
  static const TextStyle textStyle = TextStyle(color: color);
  static const UnderlineInputBorder border = UnderlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
  );

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          initialValue: '0',
                          style: textStyle,
                          autovalidate: true,
                          validator: isNumeric,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                            icon: Icon(Icons.monetization_on, color: color),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          style: textStyle,
                          validator: notEmpty,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'From Account',
                            icon: Icon(Icons.account_balance, color: color),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          style: textStyle,
                          validator: notEmpty,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'To Account',
                            icon: Icon(Icons.account_balance, color: color),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          style: textStyle,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            icon: Icon(Icons.description, color: color),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Date', style: TextStyle(color: color)),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: CupertinoDatePicker(
                          onDateTimeChanged: (datetime) {},
                        ),
                      ),
                      const SizedBox(height: 10),
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
