import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../helpers/form_check.dart';
import '../../models/transaction_model.dart';

/// Handle state for Add Income form
class IncomeBloc extends FormBloc<String, String> {
  // ignore: public_member_api_docs
  IncomeBloc() {
    addFieldBlocs(fieldBlocs: [
      amount,
      source,
      toAccount,
      description,
    ]);
  }

  /// Income amount
  final TextFieldBloc amount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required, isInt],
  );

  /// Source of income
  final TextFieldBloc source = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Account to which income was credited
  final TextFieldBloc toAccount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Any optional description of income
  final TextFieldBloc description = TextFieldBloc<NoExtraData>();

  /// timestamp of income
  DateTime timestamp = DateTime.now();

  @override
  Future<void> onSubmitting() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final trans = Income(
      id: '12',
      amount: double.tryParse(amount.value),
      source: source.value,
      toAccount: toAccount.value,
      timestamp: timestamp,
    );
    print(trans);
    emitSuccess();
  }
}
