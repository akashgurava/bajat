import 'package:flutter_form_bloc/flutter_form_bloc.dart';

/// Handle state for Transaction page
class TransactionBloc extends FormBloc<String, String> {
  // ignore: public_member_api_docs
  TransactionBloc() {
    addFieldBlocs(fieldBlocs: [
      type,
      amount,
      fromAccount,
      toAccount,
      timestamp,
    ]);
  }
  static String _isInt(String amount) {
    if (double.tryParse(amount) == null) {
      return 'Amount should not contain text';
    }
    return null;
  }

  /// Transaction type
  final TextFieldBloc type =
      TextFieldBloc<dynamic>(validators: [FieldBlocValidators.required]);

  /// Transaction amount
  final TextFieldBloc amount = TextFieldBloc<dynamic>(
      validators: [FieldBlocValidators.required, _isInt]);

  /// Account from which transaction is made
  final TextFieldBloc fromAccount =
      TextFieldBloc<dynamic>(validators: [FieldBlocValidators.required]);

  /// Account to which transaction is made
  final TextFieldBloc toAccount =
      TextFieldBloc<dynamic>(validators: [FieldBlocValidators.required]);

  /// Account to which transaction is made
  final InputFieldBloc timestamp = InputFieldBloc<DateTime, Object>();

  @override
  Future<void> onSubmitting() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emitSuccess();
  }
}
